require_relative '../config/environment'
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
#gets student name, if student does not exist, create student
type = student_or_teacher
if type == "student"
  Student.mode
elsif type == "teacher"
  Teacher.mode
end
