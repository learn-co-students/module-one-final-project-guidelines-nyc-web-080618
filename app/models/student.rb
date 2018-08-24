class Student < ActiveRecord::Base
  belongs_to :school
  has_many :reviews
  has_many :teachers, through: :reviews

  def create_review
    teacher_name = gets_teacher_name(self.school_id)
    teacher = Teacher.find_by(name: teacher_name, school_id: self.school_id)
    while teacher == nil
      puts "We do not recognize this teacher. Would you like to add?"
      user_input = yes_or_no
      if user_input == "y"
        teacher = Teacher.create(name: teacher_name,school_id: self.school_id)
      else
        teacher_name = gets_teacher_name(self.school_id)
        teacher = Teacher.find_by(name: teacher_name,school_id: self.school_id)
      end
    end

    feelings = gets_feeling_score.to_i
    quality = gets_quality.to_i
    easiness = gets_easiness.to_i
    helpfulness = gets_helpfulness.to_i
    rating = (quality + easiness + helpfulness + feelings)/4
    description = gets_description
    Review.create(description: description, rating: rating, quality: quality, easiness: easiness, helpfulness: helpfulness, feelings: feelings, student_id: self.id, teacher_id: teacher.id)
  end

end#end ofclass
