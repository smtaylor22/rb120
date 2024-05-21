module Fuel
	def fill_up
		"filling up the tank"
	end
end


class Car
  include Fuel
  attr_reader :year
  def initialize(year, model)
    @year = year
    @model = model
  end

  # def year
  #   @year
  # end
end

class Boat
  include Fuel
	attr_reader :year
	def initialize(year, model)
		@year = year
		@model = model
	end
end

car1 = Car.new(2010, "civic")
boat1 = Boat.new(2012, "Canoe")
p car1.fill_up
p boat1.fill_up


