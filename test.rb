class Cow
  attr_reader :weight
  include Comparable

  def initialize(weight)
    @weight = weight
  end


  def <=>(other)
    weight <=> other.weight
  end

end


cow1 = Cow.new(132)

cow2 = Cow.new(157)

puts (cow1 < cow2)