class TicTacToe
  attr_accessor :board
  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]
  ]
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token = "X")
    board[index] = token
  end

  def position_taken?(index)
    (board[index] == "X") || (board[index] == "O")
  end

  def valid_move?(index)
    index.between?(0,8)  && !position_taken?(index)
  end  
  
  
  def turn
  puts "Please enter 1-9:"

  user_input = gets.strip
  index = input_to_index(user_input)
  token = current_player
  
  if valid_move?(index)
    puts 'valid move'
    move(index, token)
    display_board
   else
    puts 'try again'
    turn
  end
 end
  
  
  def turn_count
    counter = 0
    board.each do |i|
    if i == "X" || i == "O"
      counter += 1
    end
  end
  return counter
  end
  
  def current_player
    if turn_count.odd?
      "O"
    else
      "X"
    end
  end

  def won?
     WIN_COMBINATIONS.detect do |win|
    if (board[win[0]]) == "X" && (board[win[1]]) == "X" && (board[win[2]]) == "X"
      return win
    elsif (board[win[0]]) == "O" && (board[win[1]]) == "O" && (board[win[2]]) == "O"
      return win
    end
      false
    end
  end
  
  def full?
    if (board.include?(" ")) || (board.include?(""))
      false
    else
      true 
    end
  end
  
  def draw?
    if full? && !won?
      true
    else
      false
    end
  end
  
  def over?
    if won? || draw?
      true
    else
      false
    end
  end
  
  def winner
    wins = nil
    WIN_COMBINATIONS.detect do |win|
     if (board[win[0]]) == "X" && (board[win[1]]) == "X" && (board[win[2]]) == "X"
       wins = "X"
     elsif (board[win[0]]) == "O" && (board[win[1]]) == "O" && (board[win[2]]) == "O"
       wins = "O"
     end
    end
    return wins
  end
  
  def play
    turn = 0
    
    until over?
      turn += 1
    end
    if won? && winner == "X"
      puts "Congratulations X!"
    elsif won? && winner == "O"
      puts "Congratulations O!"
    elsif over?
      puts "Cat's Game!"
    end  
  end
end



  