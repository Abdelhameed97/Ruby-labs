# Greet the Admin
def greet_admin
  print "Enter your name: "
  admin_name = gets.chomp
  print "Enter your age: "
  admin_age = gets.chomp.to_i
  puts "\nWelcome, #{admin_name}! You are #{admin_age} years old."
end

# Array to store student records
students = []

# Method to add student
def add_student(students)
  print "Enter student name: "
  name = gets.chomp
  print "Enter student age: "
  age = gets.chomp.to_i
  student = { name: name, age: age }
  students << student
  puts "Student #{name} added successfully!\n\n"
end

# Proc to view all students
view_students = Proc.new do |students|
  if students.empty?
    puts "No students registered yet.\n\n"
  else
    puts "\n--- All Students ---"
    students.each_with_index do |student, index|
      puts "#{index + 1}. Name: #{student[:name]}, Age: #{student[:age]}"
    end
    puts "\n"
  end
end

# Lambda to search for a student by using arrow syntax
# search_student = -> (students){
#   print "Enter the name to search: "
#   search_name = gets.chomp
#   found = students.find { |student| student[:name].downcase == search_name.downcase }
#   if found
#     puts "Student Found: Name: #{found[:name]}, Age: #{found[:age]}\n\n"
#   else
#     puts "Student not found.\n\n"
#   end
# }

# Lambda to search for a student 
search_student = lambda do |students|
  print "Enter the name to search: "
  search_name = gets.chomp
  found = students.find { |student| student[:name].downcase == search_name.downcase }
  if found
    puts "Student Found: Name: #{found[:name]}, Age: #{found[:age]}\n\n"
  else
    puts "Student not found.\n\n"
  end
end

# Start of the program
greet_admin

# Main menu loop
loop do
  puts "\n--- Main Menu ---"
  puts "1. Add Student"
  puts "2. View All Students"
  puts "3. Search Student by Name"
  puts "4. Exit"
  print "Choose an option (1-4): "
  choice = gets.chomp

  case choice
  when "1"
    add_student(students)
  when "2"
    view_students.call(students)
  when "3"
    search_student.call(students)
  when "4"
    puts "\nThank You"
    break
  else
    puts "Invalid choice. Please try again."
  end
end
