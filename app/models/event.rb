class Event < ActiveRecord::Base
  belongs_to :artist
  belongs_to :city
  has_many :invitations
  has_many :guest_stars, through: :invitations
  has_many :user_events
  has_many :users, through: :user_events

  def self.highest_price
    self.maximum(:price)
  end

  def self.most_expensive_event
    self.find_by price: highest_price
  end

  def self.lowest_price
    self.minimum(:price)
  end

  def self.cheapest_event
    self.find_by price: lowest_price
  end

  def find_guest_star
    self.guest_stars.pluck(:name)
  end

  def find_artist
    self.artist.name 
  end


end
