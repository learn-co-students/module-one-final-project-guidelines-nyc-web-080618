class City < ActiveRecord::Base
  has_many :events
  has_many :artists, through: :events

  def lowest_price
    self.events.minimum(:price)
  end

  def lowest_price_event
    self.events.find_by price: lowest_price
  end




end #end of class
