class User < ActiveRecord::Base
  has_many :ownerships, :foreign_key => "owner_id"
  has_many :pets, through: :ownerships
  has_many :requests, :foreign_key => "owner_id"
  has_many :walks, :foreign_key => "walker_id"
end
