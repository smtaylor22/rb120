class Person
  attr_reader :name
  def initialize(name, ssn)
    @name = name
    @ssn = ssn
  end

  def social
    puts "#{name}'s social is #{ssn[0, 4]}"
  end

  private 
  attr_reader :ssn

end

bob1 = Person.new("Bob", '12345')
puts bob1.name
puts bob1.social