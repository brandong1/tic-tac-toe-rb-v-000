
  WIN_COMBINATIONS = [
    [0, 1, 2], # Top throw
    [3, 4, 5], # Middle row 
    [6, 7, 8], # Bottom row
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
    
  ]
  
  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  def turn(board)
    puts "Please enter 1-9:"
  
    input = gets.strip # I'm getting a users input 
    index = input_to_index(input) # Calling input_to_index method
  
    if valid_move?(board, index) 
      puts "Valid Move"
      move(board, index) # Calls the move method
      display_board(board) # Displays board with updated index
    else
     puts "Invalid move. Try again."
     turn(board) # Re-runs the turn() method (i.e. re-runs this code block)
    end
  end
  
  
  def input_to_index(move)
     index = move.to_i - 1 # Declares the index variable, changes it to an integer and -1 to correspond to the array indexes
     index
  end
  
  def valid_move?(board, index)
    if index.to_i.between?(0, 8) && !position_taken?(board, index)
      true 
    else
      false 
    end
  end
  
  def position_taken?(board, index)
      if board[index] == " " || board[index] == "" || board[index] == nil
          false
      else
          true
      end
  end
  
  def move(board, index, player = "X") # In this instance, we give player a default value of "X"
    board[index] = player # Updates the board array index location with player, or in this case, the default value "X"
    
  end
  
  def turn_count(board)
    counter = 0
    board.each do |turn|
      if turn == "X" || turn == "O"
        counter += 1 
      end 
    end
    counter
  end
  
  def current_player(board)
    turn = "X"
    if turn_count(board) % 2 == 0 
      puts "X" 
       turn
    else
      turn = "O"
      puts "O"
      turn
    end 
  end