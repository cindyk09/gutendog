class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :ownerships, :foreign_key => "owner_id"
  has_many :pets, through: :ownerships
  has_many :requests, :foreign_key => "owner_id"
  has_many :walks, :foreign_key => "walker_id"

  def name
    binding.pry
    self.first_name + " " + self.last_name
  end
end
