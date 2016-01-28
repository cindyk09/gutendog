class Ownership < ActiveRecord::Base
  belongs_to :pet
  belongs_to :owner, class_name: 'User'
end
