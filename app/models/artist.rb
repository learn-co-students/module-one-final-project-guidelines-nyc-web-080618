class Artist < ActiveRecord::Base
    has_many :events
    has_many :cities, through: :events



    def find_all_guest_stars
      self.events.map{ |event|
        event.find_guest_star }.flatten
    end



end
