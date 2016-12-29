class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_many :ownerships, :foreign_key => "owner_id", dependent: :destroy
  has_many :pets, through: :ownerships
  has_many :requests, :foreign_key => "owner_id", dependent: :destroy
  has_many :walks, :foreign_key => "walker_id", dependent: :destroy
  has_many :notifications, :foreign_key => "recipient_id", dependent: :destroy
  has_many :friend_noticiations, class_name: "Notification", :foreign_key => "friend_requester_id", dependent: :destroy

  has_many :friendships, dependent: :destroy
  # has_many :friends, through: :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  # has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  geocoded_by :address
  after_validation :geocode, :if => :address_present?
  after_initialize :init

  def init
    self.address1 ||= ""
    self.address2 ||= ""
    self.city ||= ""
    self.state ||= ""
    self.zipcode ||= ""
    #to make sure we don't get nil values.
  end

  def real_friends
    self.friendships.map{|friendship| friendship.friend if friendship.confirmed}.compact + self.inverse_friendships.map{|friendship| friendship.user if friendship.confirmed}.compact
  end

  def pending_friends
    self.inverse_friendships.map{|friendship| friendship.user if !friendship.confirmed}.compact
  end

  def friend_of(user)
    self.real_friends.include?(user)
  end

  def name
    self.first_name + " " + self.last_name
  end

  def active_requests
    requests.select do |request|
      request.active?
    end
  end

  def num_active_requests
    self.active_requests.size
  end

  def fulfilled_requests
    requests.select do |request|
      !request.active?
    end
  end

  def karma
    self.walks.select{|walk| walk.completed}.size
  end

  def pending_walks
    walks.map{ |w| w if !w.completed }.compact
  end

  #omniauth Facebook
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      parse_name(user, auth.info.name)   # assuming the user model has a name

      # user.image = auth.info.image # assuming the user model has an image
    end
  end

  def scheduled_walks
    self.fulfilled_requests.map do |request|
      if !request.walk.completed
        request.walk
      end
    end.compact
  end

  #location
  def address

    address1 + " " + address2 + " " + city + " " + state + " " + zipcode
  end

  def address_present?
    self.address.strip != ""
  end
  def friends
    friend_ids = User.first.friendships.map {|friendship| friendship.friend_id}
    friend_ids.map {|id| User.find(id)}
  end

  def request_and_walks_for_json
    array = []
    self.active_requests.each do |request|
      array << {content:"You Need Walker", start_time:request.start_time, end_time:request.end_time}
    end
    self.scheduled_walks.each do |walk|
      array << {content:"#{walk.walker.first_name}'s Walking The Pups", start_time:walk.request.start_time, end_time:walk.request.end_time}
    end
    self.pending_walks.each do |walk|
      array << {content:"You're Walking #{walk.request.owner.first_name}'s' Pups", start_time:walk.request.start_time, end_time:walk.request.end_time}
    end
    array
  end

  private
  def self.parse_name(user, name)
    name_arr = name.split(" ")
    user.last_name = name_arr.pop
    user.first_name = name_arr.join(" ")
  end

end
