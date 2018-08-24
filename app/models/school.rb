class School < ActiveRecord::Base
  has_many :teachers
  has_many :students

  def highest_rated_teacher
    teacher_list = Teacher.where(school_id: self.id)
    average_rating_list = teacher_list.map do |teacher|
      sum = 0
      review_list = teacher.reviews
      review_list.each do |review|
        sum += review.rating
      end
      if review_list.any?
        sum/review_list.count
      else
        0
      end
    end
    puts "#{teacher_list[average_rating_list.each_with_index.max[1]].name} is the highest rated teacher at #{self.name}."
    teacher_list[average_rating_list.each_with_index.max[1]]
  end

  def lowest_rated_teacher
    teacher_list = Teacher.where(school_id: self.id)
    average_rating_list = teacher_list.map do |teacher|
      sum = 0
      review_list = teacher.reviews
      review_list.each do |review|
        sum += review.rating
      end
      if review_list.any?
        sum/review_list.count
      else
        0
      end
    end
    puts "#{teacher_list[average_rating_list.each_with_index.min[1]].name} is the lowest rated teacher at #{self.name}."
    teacher_list[average_rating_list.each_with_index.min[1]]
  end

end
