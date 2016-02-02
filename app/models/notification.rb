class Notification < ActiveRecord::Base
  belongs_to :recipient, class_name: "User"
  belongs_to :walk
  belongs_to :request

  def dog_walked
    # "Kevin Mircovich walked: Reece, and Drake"
    "#{self.walk.walker.name} walked:" + list_dog_names(self.walk.pets)
  end

  def request_accepted
    # "Kevin Mircovich accepted your request to walk Reece, and Drake on 2016-02-12 16:21:21 UTC"
    "#{walk.walker.name} accepted your request to walk" + list_dog_names(walk.pets) + " on #{self.walk.request.start_time}"
  end

  private

  def list_dog_names(collection)
    string = ""
    collection.each_with_index do |pet, index|
      if collection.count == 1 || pet == collection[0]
        string += " #{pet.name}"
      else
        if pet == collection.last
          string += ", and #{pet.name}"
        else
          string += ", #{pet.name}"
        end
      end
    end
    string
  end
end
