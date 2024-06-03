module FourWheeler
  WHEELS = 4
end

class Vehicle
  include FourWheeler

  def maintenance
    "Changing #{WHEELS} tires."
  end
end

class Car < Vehicle
  

  def wheels
    WHEELS
  end
end

car = Car.new
puts car.wheels        # => 4
puts car.maintenance   # => NameError: uninitialized constant Vehicle::WHEELS