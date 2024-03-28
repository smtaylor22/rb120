class GuessingGame

  GUESS_RANGE = 1..100

  def initialize
    @remaining_guesses = 7
    @guess = nil
    @number = rand

  end

  def play


  end

  def get_guess
    "You have #{remaining_guesses} guesses remaining."
    loop do
      guess_prompt
      self.guess = gets.chomp.to_i
      break if valid_guess?(guess)
      puts "Invalid guess"
    end
    self.remaining_guesses -= 1
  end

  def valid_guess?(guess)
    GUESS_RANGE.include?(guess)
  end

  def process_guest(guess)
    case guess
    when 

  end

  def guess_prompt
    puts "Enter a number between #{GUSS_RANGE.begin} and #{GUESS_RANGE.end}:"
  end


  private

  attr_accessor :remaining_guesses, :guess

end