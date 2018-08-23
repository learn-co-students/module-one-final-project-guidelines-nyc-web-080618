class GuestStar < ActiveRecord::Base
  has_many :invitations
  has_many :events, through: :invitations

  def find_all_artist
    self.events.map {|event|
      event.find_artist}
  end



end
