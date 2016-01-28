class User < ActiveRecord::Base
  has_many :ownerships, :foreign_key => "owner_id"
  has_many :pets, through: :ownerships
end
