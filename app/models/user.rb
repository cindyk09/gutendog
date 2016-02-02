class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_many :ownerships, :foreign_key => "owner_id"
  has_many :pets, through: :ownerships
  has_many :requests, :foreign_key => "owner_id"
  has_many :walks, :foreign_key => "walker_id"

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
      self.walks.size
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

  def parse_name(user, name)
    name_arr = name.split(" ")
    name.last_name = name_arr.pop
    name.first_name = name_arr.join(" ")
  end

end
