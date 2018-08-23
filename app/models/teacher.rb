class Teacher < ActiveRecord::Base
  has_many :reviews
  has_many :students, through: :reviews
  belongs_to :school


#highest rating of a specific teacher
  def highest_review
      arr = Review.all.select do |review|
        review.teacher_id == self.id
      end
      arr.maximum(rating)
      binding.pry
  end

  def lowest_review

  end





end#END OF CLASS
