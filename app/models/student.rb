class Student < ActiveRecord::Base
  belongs_to :school
  has_many :reviews
  has_many :teachers, through: :reviews

  def create_review
    teacher_choice = gets_teacher_choice(self.school_id)
    if teacher_choice.class == String
      teacher = Teacher.find_by(name: teacher_choice, school_id: self.school_id)
      while teacher == nil
        puts $pastel.red("We do not recognize this teacher. Would you like to add?")
        user_input = yes_or_no
        if user_input == "y"
          teacher = Teacher.create(name: teacher_choice,school_id: self.school_id)
        else
          teacher_name = gets_teacher_choice(self.school_id)
          teacher = Teacher.find_by(name: teacher_choice,school_id: self.school_id)
        end
      end
    elsif teacher_choice.class == Fixnum
      teacher_list = Teacher.where(school_id: self.school_id)
      teacher = teacher_list[teacher_choice-1]
    end

    feeling_choice = gets_feeling
    feeling_score = Feeling.get_feeling_score(feeling_choice)
    feeling = Feeling.find(feeling_choice+Feeling.first.id-1).emoji
    quality = gets_quality.to_i
    easiness = gets_easiness.to_i
    helpfulness = gets_helpfulness.to_i
    rating = (quality + easiness + helpfulness + feeling_score)/4
    description = gets_description
    Review.create(description: description, rating: rating, quality: quality, easiness: easiness, helpfulness: helpfulness, feelings: feeling, student_id: self.id, teacher_id: teacher.id)
  end

  def self.mode
    student_name = gets_name
    student = Student.find_by(name: student_name)
    while student == nil
      puts "We do not recognize you. Would you like to register?"
      user_input = yes_or_no
      if user_input == "y"
        student = Student.create(name: student_name)
      else
        student_name = gets_name
        student = Student.find_by(name: student_name)
      end
    end

    #gets school, if school does not exist, asks for location to create new school
    school_name = gets_school_name
    school = School.find_or_create(school_name)


    ##add school_id to student object if student was just created
    if student.school_id == nil || student.school_id != school.id
      student.update(school_id: school.id)
    end

    user_input = gets_student_commands
    while user_input != "5"
      case user_input
      when "1"
        student.create_review
        user_input = continue?("s")
      when "2"
        if school.teachers == []
          puts $pastel.red("There are no teachers listed for your school.")
        else
          school.highest_rated_teacher
        end
        user_input = continue?("s")
      when "3"
        if school.teachers == []
          puts $pastel.red("There are no teachers listed for your school.")
        else
          school.lowest_rated_teacher
        end
        user_input = continue?("s")
      when "4"
        teacher_list = Teacher.where(school_id: student.school_id)
        if teacher_list == []
          puts $pastel.red("There are no teachers listed for your school.")
        else
          puts $pastel.red("Select a teacher:")
          print_list(teacher_list,:name)
          user_input = gets.chomp.to_i
          teacher = teacher_list[user_input-1]
          sum = 0
          teacher.reviews.each do |review|
            sum += review.rating
          end
          puts "#{teacher.name}'s average rating is #{sum/teacher.reviews.count}."
        end
        user_input = continue?("s")
      when "5"
        break
      end
    end
  end

end#end ofclass
