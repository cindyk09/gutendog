class Request < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_one :walk

  def active?
    !self.walk
  end
end
