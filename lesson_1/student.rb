class Student
  attr_accessor :name
  attr_writer :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  attr_reader :grade

  
end


joe = Student.new("Joe", 3.5)
sally = Student.new("Sally", 4.0)

puts joe.name

puts joe.better_grade_than?(sally)

puts sally.better_grade_than?(joe)

puts "Well done!" if sally.better_grade_than?(joe)