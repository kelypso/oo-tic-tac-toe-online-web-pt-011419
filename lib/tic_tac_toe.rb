class TicTacToe
  attr_accessor :board

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # columns
    [0, 4, 8], [2, 4, 6] #diagonals
  ]

  def initialize()
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    @board.find_index{|i| i == input.to_i - 1}
    # return corresponding index from @board array
  end

  def move(index, token)
    @board[index] = token
    # takes in index and player's token (defaults to x)
  end

  def position_taken?
    @board[index] != " "
  end

  def valid_move?
    !position_taken?(index) && index.between?(0,8)
  end

  def turn
    puts "Please enter a number (1-9):"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) &&
        @board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]]
        return combo
      end
    end
  end

  def full?
    @board.all?{|x| x != " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if combo = won?
      @board[combo[0]]
  end

  def play
    # main method, responsible for the game loop - SEE PSEUDOCODE
  end

end
