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
end
