class MyCar

  attr_accessor :year, :color, :model, :speed
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(accelerate)
    speed = speed + accelerate
  end

  def brake(deaccelerate)
    speed -= deaccelerate
  end

  def shut_off
    speed = 0
  end
end


tacoma = MyCar.new(1998, 'Silver', 'Tacoma')

puts tacoma.year
puts tacoma.speed

tacoma.speed_up(10)
tacoma.speed
