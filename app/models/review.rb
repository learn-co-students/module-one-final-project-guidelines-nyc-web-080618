class Review < ActiveRecord::Base

belongs_to :teacher
belongs_to :student
# has_many :feelings, :foreign_key => "score"






end #END OF CLASS
