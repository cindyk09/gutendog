class Notification < ActiveRecord::Base
  belongs_to :recipient, class_name: "User"
  belongs_to :walk
  belongs_to :request
end
