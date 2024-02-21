class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed
    @speed
  end
  def speed_up(accelerate)
    @speed += accelerate
  end

  def brake(deaccelerate)
    @speed -= deaccelerate
  end

  def shut_off
    @speed = 0
  end

  def spray_paint(color)
    self.color = color
    puts "color is now #{self.color} and speed is #{self.speed}"
  end
end


tacoma = MyCar.new(1998, 'Silver', 'Tacoma')

puts tacoma.speed

tacoma.speed_up(10)
puts tacoma.speed

# puts tacoma.color
# tacoma.color = "Yellow"
# puts tacoma.color
# puts tacoma.year

tacoma.spray_paint('Black')
puts tacoma.color