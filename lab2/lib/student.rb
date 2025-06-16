require_relative 'person'
require_relative 'reportable'

class Student < Person
  include Reportable

  attr_accessor :grades

  def initialize(name)
    super(name)
    @grades = []
  end

  def add_grade(subject, grade)
    @grades << { subject: subject, grade: grade.to_f }
  end

  def calculate_gpa
    return 0.0 if @grades.empty?
    total = @grades.sum { |g| g[:grade] }
    total / @grades.size
  end

  def to_s
    "#{@name} - GPA: #{calculate_gpa.round(2)}"
  end

  def to_h
    { name: @name, grades: @grades }
  end
end
