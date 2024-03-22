# frozen_string_literal: true

# class for board state
class Board
  ##
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      return squares.first.marker if three_identical_markers?(squares)
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts '     |     |'
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts '     |     |'
    puts '-----+-----+-----'
    puts '     |     |'
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts '     |     |'
  end
  # rubocop:enable all

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3

    markers.min == markers.max
  end
end

# class representing for square state and behavior
class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

# Class for Player state
class Player
  attr_reader :marker

  def initialize(computer: false)
    @marker = computer ? marker : choose_human_marker
    @name = set_human_name
  end


end


class Human < Player
  def choose_marker
    puts 'Choose your marker: type "X" or "O".'
    loop do
      marker = gets.chomp.upcase
      return marker if marker == 'X' || marker == 'O'
      puts 'Invalid marker: Choose "X" or "O"'
    end
  end

end

class Computer < Player


end

# Module for simple player greeting messages
module SimpleMessages
  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
    puts ''
  end

  def display_goodbye_message
    puts 'Thanks for playing Tic Tac Toe! Goodbye!'
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end
end

# Class for playing actual game, contains state and game methods
class TTTGame

  # HUMAN_MARKER = 'X'
  # COMPUTER_MARKER = 'O'
  # FIRST_TO_MOVE = @human.marker

  attr_reader :board, :human, :computer, :org_marker

  include SimpleMessages

  def initialize
    @board = Board.new
    @human = Player.new
    @computer = Player.new
    @current_marker = human.marker
    @org_marker = human.marker # human is default first player
  end


  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      display_board
      player_move
      display_result
      break unless play_again?

      reset
      display_play_again_message
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?

      clear_screen_and_display_board if human_turn?
    end
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == human.marker
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ''
    board.draw
    puts ''
  end

  def human_moves
    puts "Choose a square (#{board.unmarked_keys.join(', ')}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)

      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts 'You won!'
    when computer.marker
      puts 'Computer won!'
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if %w[y n].include? answer

      puts 'Sorry, must be y or n'
    end

    answer == 'y'
  end

  def clear
    system 'clear'
  end

  def reset
    board.reset
    @current_marker = org_marker
    clear
  end
end

game = TTTGame.new
game.play

