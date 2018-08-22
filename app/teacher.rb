class Teacher < ActiveRecord::Base
  has_many :students, through: :reviews
  belongs_to :school






end#END OF CLASS
