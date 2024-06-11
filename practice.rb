
# Without adding any methods below, implement a solution; originally by Natalie Thompson, 
# this version by Oscar Cortes
class ClassA 
  attr_reader :field1, :field2

  def initialize(num)
    @field1 = "xyz"
    @field2 = num
  end

  
end

class ClassB 
  attr_reader :field1
  include Comparable

  def initialize
    @field1 = "abc"
  end

  def <=>(other)
    if other.is_a?(ClassA)
      self.field1 <=> other.field1
    elsif other.is_a?(ClassB)
      self.field1 <=> other.field1
    else
      nil
    end
  end
end


obj1 = ClassA.new(50)
obj2 = ClassA.new(25)
obj3 = ClassB.new


p obj2 > obj3
p obj1 > obj2