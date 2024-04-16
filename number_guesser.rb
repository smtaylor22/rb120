class GuessingGame

  GUESS_RANGE = 1..100

  def initialize
    @remaining_guesses = 7
    @guess = nil
    @number = rand(GUESS_RANGE)
  end

  def play
    while remaining_guesses > 0
      puts "You have #{remaining_guesses} guesses remaining."
      get_valid_guess
      self.remaining_guesses -= 1
      break if winning_guess?(guess)
    end

    if remaining_guesses < 1
      puts "You have no more guesses. You lost!"
    else 
      puts "You Won!"
    end
  end

  def get_valid_guess
    loop do
      guess_prompt
      self.guess = gets.chomp.to_i
      break if valid_guess?(guess)
      puts "Invalid guess."
    end
  end

  def guess_prompt
    puts "Enter a number between #{GUESS_RANGE.begin} and #{GUESS_RANGE.end}:"
  end

  def valid_guess?(guess)
    GUESS_RANGE.include?(guess)
  end

  def winning_guess?(guess)
    case guess
    when (1...number)
      puts "Your guess is too low.\n\n"
      false
    when ((number + 1)..100) then 
      puts "Your guess is too high.\n\n"
      false
    else
      puts "That's the number\n\n"
      true
    end
  end




  private

  attr_accessor :remaining_guesses, :guess, :number

end

game = GuessingGame.new
game.play