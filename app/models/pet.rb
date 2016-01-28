class Pet < ActiveRecord::Base
  has_many :ownerships
  has_many :owners, through: :ownerships
  has_many :petwalks
  has_many :walks, through: :petwalks
end
