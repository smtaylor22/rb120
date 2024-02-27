class Vehicle
  attr_accessor :color, :model, :speed
  attr_reader :year
  
  @@num_of_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@num_of_vehicles += 1
  end

  @@Vehicles
  def speed_up(accelerate)
    @speed += accelerate
    puts "Speeding up. Speed is now #{speed}"

  end

  def brake(deaccelerate)
    @speed -= deaccelerate
    puts "Slowing down. Speed is now #{speed}"
  end

  def shut_off
    @speed = 0
    puts "Speed is now #{speed}"
  end

  def self.calc_mileage(miles, gals)
    puts "#{miles / gals} miles per gallon of gas"
  end

  def spray_paint(color)
    self.color = color
    puts "color is now #{self.color} and speed is #{self.speed}"
  end

  def self.print_num_vehicles
    puts @@num_of_vehicles
  end
end

module Freight
  def load_freight(item)
    puts "Loading #{item} on pickup."
  end
end

class MyCar < Vehicle

  NUM_OF_DOORS = 2

  def to_s
    "This car is a #{color} #{model} from #{year}"
  end

end


class MyTruck < Vehicle
  include Freight
  NUM_OF_DOORS = 4

  def to_s
    "This truck is a #{color} #{model} from #{year}"
  end
end


tacoma = MyTruck.new(1998, 'Silver', 'Tacoma')

puts tacoma.speed

tacoma.speed_up(10)
tacoma.speed

puts tacoma.color
tacoma.color = "Yellow"
puts tacoma.color
puts tacoma.year

tacoma.spray_paint('Black')
puts tacoma.color

puts tacom

subaur = MyCar.new(2005, 'Red', "Forester")

MyCar.calc_mileage(60, 12)

puts tacoma


Vehicle.print_num_vehicles