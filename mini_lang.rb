class Stack < Array
  def initialize
    super
  end

  def custom_pop
    item = self.pop
    return "Empty Stack!" if self.empty?
    item
  end
end


class Minilang
  attr_reader :instructions
  attr_accessor :stack, :register

  def initialize(arg)
    raise TypeError.new("Input must be a string") unless arg.instance_of?(String)
    @instructions = arg.split
    @stack = Stack.new
    @register = 0
  end

  def eval
    instructions.each do |token|
      # Check if token is Number
      if token =~ /\A[-+]?\d+\z/
        self.register = token.to_i
      else
        case token
        when 'ADD'   then self.register += stack.custom_pop
        when 'DIV'   then self.register /= stack.custom_pop
        when 'MULT'  then self.register *= stack.custom_pop
        when 'MOD'   then self.register %= stack.custom_pop
        when 'SUB'   then self.register -= stack.custom_pop
        when 'PUSH'  then stack.push(register)
        when 'POP'   then self.register = stack.custom_pop
        when 'PRINT' then puts register
        else         raise InvalidInstruction.new("Invalid token: #{token}")
        end
      end

    end
  end
end


class InvalidInstruction < StandardError; end



Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)