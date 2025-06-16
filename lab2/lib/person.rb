class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_s
    "Person: #{@name}"
  end
end
  