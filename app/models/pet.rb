class Pet < ActiveRecord::Base
  has_many :ownerships, dependent: :destroy
  has_many :owners, through: :ownerships
  has_many :petwalks, dependent: :destroy
  has_many :walks, through: :petwalks
  mount_uploader :image, ImageUploader

  def truncated_description
    if description.length > 214
      description[0..170] + "..."
    else
      description
    end

  end

  def owner_friends?(user)
    friends = false
    self.owners.each do |owner|
      if owner.friend_of(user)
        friends = true
        return true
      end
    end
    return friends
  end
end
