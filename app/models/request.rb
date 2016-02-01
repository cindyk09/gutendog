class Request < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_one :walk

  def active?
    !self.walk
  end

  def self.active_requests
    self.all.select do |request|
      request.active?
    end
  end
end
