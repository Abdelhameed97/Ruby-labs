require 'json'
require_relative 'student'

module Report
  FILE_PATH = 'data/students.txt'

  def self.save(students)
    File.open(FILE_PATH, 'w') do |file|
      file.write(JSON.pretty_generate(students.map(&:to_h)))
    end
    puts "✅ Report saved to #{FILE_PATH}"
  rescue => e
    puts "Error saving report: #{e.message}"
  end

  def self.load
    if File.exist?(FILE_PATH)
      data = JSON.parse(File.read(FILE_PATH))
      data.map do |student_data|
        student = Student.new(student_data['name'])
        student_data['grades'].each do |g|
          student.add_grade(g['subject'], g['grade'])
        end
        student
      end
    else
      []
    end
  rescue => e
    puts "Error loading report: #{e.message}"
    []
  end
end
