
class Vehicle
  def initialize(name)
    @name = name
  end

end

class Car < Vehicle

  def name
    puts @name
  end
end


car1 = Car.new("John")
car1.name