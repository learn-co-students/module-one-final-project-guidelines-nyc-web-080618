class Teacher < ActiveRecord::Base
  has_many :reviews
  has_many :students, through: :reviews
  belongs_to :school

  def avg_rating
    if reviews.any?
      sum = 0
      reviews.each do |review|
        sum += review.rating
      end
      puts "Your average rating is #{sum/reviews.count}."
    else
      puts "You do not have any reviews."
    end
  end

  def display_all_reviews
    reviews.each do |review|
      puts "********************"
      puts "Review: #{review.description}"
      puts "Quality: #{review.quality}"
      puts "Easiness: #{review.easiness}"
      puts "Helpfulness: #{review.helpfulness}"
      puts "Feeling: #{review.feelings}"
      puts "Rating: #{review.rating}"
      puts "********************"
    end
  end

  def self.mode
    teacher_name = gets_name
    teacher = Teacher.find_by(name: teacher_name)
    while teacher == nil
      puts "We do not recognize you. Would you like to register?"
      user_input = yes_or_no
      if user_input == "y"
        teacher = Teacher.create(name: teacher_name)
      else
        teacher_name = gets_name
        teacher = Teacher.find_by(name: teacher_name)
      end
    end

    #gets school, if school does not exist, asks for location to create new school
    school_name = gets_school_name
    school = School.find_or_create(school_name)

    ##add school_id to student object if student was just created
    if teacher.school_id == nil || teacher.school_id != school.id
      teacher.update(school_id: school.id)
    end

    user_input = gets_teacher_commands
    while user_input != "5"
      case user_input
      when "1"
        if teacher.reviews.any?
          teacher.display_all_reviews
        else
          puts "You do not have any reviews."
        end
        user_input = continue?("t")
      when "2"
        teacher.avg_rating
        user_input = continue?("t")
      when "3"
        sorted_list = teacher.reviews.sort_by do |review|
          review.rating
        end
        highest_review = sorted_list.last
        puts "********************"
        puts "Review: #{highest_review.description}"
        puts "Quality: #{highest_review.quality}"
        puts "Easiness: #{highest_review.easiness}"
        puts "Helpfulness: #{highest_review.helpfulness}"
        puts "Feeling: #{highest_review.feelings}"
        puts "Rating: #{highest_review.rating}"
        puts "********************"
        user_input = continue?("t")
      when "4"
        sorted_list = teacher.reviews.sort_by do |review|
          review.rating
        end
        lowest_review = sorted_list.first
        puts "********************"
        puts "Review: #{lowest_review.description}"
        puts "Quality: #{lowest_review.quality}"
        puts "Easiness: #{lowest_review.easiness}"
        puts "Helpfulness: #{lowest_review.helpfulness}"
        puts "Feeling: #{lowest_review.feelings}"
        puts "Rating: #{lowest_review.rating}"
        puts "********************"
        user_input = continue?("t")
      when "5"
        break
      end
    end
  end
end#END OF CLASS
