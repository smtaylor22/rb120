=begin
print horizontal rule
print the empty line 
pritn the  message line
print the emtpy line
print the horizontal rule

=end


# class Banner
#   def initialize(message)
#     @message = message
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def horizontal_rule
#     "+-" + '-'*@message.size + "-+"
#   end

#   def empty_line
#     "| " + " "*@message.size + " |"
#   end

#   def message_line
#     "| #{@message} |"
#   end
# end

# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner

# banner = Banner.new('')
# puts banner


=begin
print horizontal rule
print the empty line 
pritn the  message line
print the emtpy line
print the horizontal rule

pass a number to calculate the width of the banner

when string is larger than given width
  split string in half 
  output each line of message with padding

when smaller
  add padding in space to reach width
when even number of spaces to add just add them
  if odd number
    add the first then add the second plus 1
  width of eleven
  message size = 6
  11-5 = 6
  5/2 = 2
  |  hello  |

  width 50
  message 42

  8 / 2 = 4

=end


class Banner
  def initialize(message, width=message.size)
    p message.size
    p width
    @message = message
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+-" + '-'*(@width - 4) + "-+"
  end

  def empty_line
    "| " + " "*(@width - 4) + " |"
  end

  def message_line
    if @message.size < @width
      if message_can_be_centered?
        "|#{' '*(spaces_available / 2)}#{@message}#{' '*(spaces_available/2)}|".center(@width)
      else
        "|#{' '*(spaces_available / 2)}#{@message}#{' '*((spaces_available/2) + 1)}|".center(@width)
      end

    end
  end

  def spaces_available
    (@width - 2)- @message.size
  end

  def message_can_be_centered?
    spaces_available.even?
  end
end

# banner = Banner.new('To boldly go where no one has gone before.', 57)
# puts banner

# banner = Banner.new('')
# puts banner

banner = Banner.new("hello", 10)
puts banner