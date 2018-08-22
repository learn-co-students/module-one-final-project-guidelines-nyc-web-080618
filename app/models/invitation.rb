class Invitation < ActiveRecord::Base
  belongs_to :event
  belongs_to :guest_star




end
