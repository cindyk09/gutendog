class Petwalk < ActiveRecord::Base
  belongs_to :walk
  belongs_to :pet
end
