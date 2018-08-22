class Student < ActiveRecord::Base
  belongs_to :school
  has_many :reviews
  has_many :teachers, through: :reviews


  









end#end ofclass
