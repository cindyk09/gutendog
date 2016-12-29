class Notification < ActiveRecord::Base
  belongs_to :recipient, class_name: "User"
  belongs_to :walk
  belongs_to :request
  belongs_to :friend_requester, class_name: "User"

  def dog_walked
    # "Kevin Mircovich walked: Reece, and Drake"
    "#{self.walk.walker.name} walked:" + list_dog_names(self.walk.pets)
  end

  def request_accepted
    # "Kevin Mircovich accepted your request to walk Reece, and Drake on 2016-02-12 16:21:21 UTC"
    "#{walk.walker.name} accepted your request to walk" + list_dog_names(walk.pets) + " on #{self.walk.request.start_time}"
  end

  def friend_request
    friend_requester.name + " sent you a friend request!"
  end

  def request_cancellation
    # fix this to
    "Brandyn Mayer canceled the walk for 2016-02-10 01:56:20 UTC. You're off the hook."
  end

  def truncated
    message[0..40]# + "..."
  end

  private

  def list_dog_names(collection)
    # try to refactor this method to something that would say current_user.pets.walked.name
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
