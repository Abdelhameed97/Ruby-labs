require_relative 'student'
require_relative 'report'

class StudentReportManager
  def initialize
    @students = Report.load
  end

  def run
    puts "Welcome to Student Report Manager!"
    loop do
      menu
      print "> "
      case gets.chomp.to_i
      when 1 then add_student
      when 2 then add_grade
      when 3 then show_all_students
      when 4 then Report.save(@students)
      when 5 then @students = Report.load
      when 0 then puts "Thank You"; break
      else puts "Invalid option. Try again."
      end
    end
  end

  private

  def menu
    puts "\n1. Add Student"
    puts "2. Add Grade"
    puts "3. Show All Students"
    puts "4. Save Report"
    puts "5. Load Report"
    puts "0. Exit"
  end

  def add_student
    print "Enter student name: "
    name = gets.chomp
    @students << Student.new(name)
    puts "Student added!"
  end

  def add_grade
    print "Enter student name: "
    name = gets.chomp
    student = @students.find { |s| s.name == name }
    if student
      print "Enter subject: "
      subject = gets.chomp
      print "Enter grade: "
      grade = gets.chomp
      student.add_grade(subject, grade)
      puts "Grade added!"
    else
      puts "Student not found!"
    end
  end

  def show_all_students
    if @students.empty?
      puts "No students found."
    else
      @students.each { |student| puts student }
    end
  end
end
