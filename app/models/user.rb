class User < ActiveRecord::Base
  has_secure_password
  has_many :ownerships, :foreign_key => "owner_id"
  has_many :pets, through: :ownerships
  has_many :requests, :foreign_key => "owner_id"
  has_many :walks, :foreign_key => "walker_id"

  def name
    self.first_name + " " + self.last_name
  end
end
