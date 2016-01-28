class Walk < ActiveRecord::Base
  belongs_to :walker, class_name: "User"
  belongs_to :request
  has_many :petwalks
  has_many :pets, through: :petwalks
end
