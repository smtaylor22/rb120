module Walkable
  def walk
    "#{name} #{gait} forward"
  end

end

class Person
  attr_reader :name
  include Walkable
  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Noble
  attr_reader :title

  include Walkable
  def initialize(name, title)
    @name = name
    @title = title
  end

  def name
    "#{title} #{@name}"
  end

  private
  
  def gait
    "struts"
  end
end

byron = Noble.new("Byron", "Lord")
puts byron.walk
# => "Lord Byron struts forward"


puts byron.name
# => "Byron"
puts byron.title
# => "Lord"