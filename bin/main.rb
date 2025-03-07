#!/usr/bin/env ruby
require_relative '../lib/logic'
require_relative '../lib/player'
board = %w[1 2 3 4 5 6 7 8 9]

def display_board(board)
  s = "      +---+---+---+
      | #{board[0]} | #{board[1]} | #{board[2]} |
      +---+---+---+
      | #{board[3]} | #{board[4]} | #{board[5]} |
      +---+---+---+
      | #{board[6]} | #{board[7]} | #{board[8]} |
      +---+---+---+"
  puts s
end
puts 'Welcome to Tic-Tac-Toe v1.0'
player1 = Player.new
puts 'Welcome, player 1'
puts 'Please input your game name...'
select1 = false
while select1 == false
  @p1 = gets.chomp.upcase
  select1 = player1.name_check(@p1)
  p 'NAME SHOULD NOT BE BLANK' if select1 == false
end
puts
puts 'Welcome, player 2'
puts 'Please input your game name...'
select1 = false
while select1 == false
  @p2 = gets.chomp.upcase
  select1 = player1.name_check(@p2)
  p 'NAME SHOULD NOT BE BLANK' if select1 == false
end
puts
puts "#{@p1} plays with 'X' and #{@p2} plays with 'O'"
puts
puts 'INSTRUCTION!!!:Input the corresponding cell number in which you want to place your piece when prompted'
puts
puts 'Let us get right to it!'
puts
puts
# display_board(board)
display_board(board)
puts
puts

def cell_check(cell, person, arr1, arr2)
  if (arr1.include? cell) || (arr2.include? cell)
    puts 'Cell position has been taken, select a new cell'
    false
  elsif (1..9).include? cell
    if person == @p1
      arr1 << cell
    else
      arr2 << cell
    end
    true
  else
    puts 'Invalid selection, Please enter a valid number between 1-9'
    false
  end
end
param2 = []
arr1 = []
arr2 = []
session = true
turn = 0
while session
  checklist = Logic.new
  puts "#{@p1}: Please choose a cell number "
  turn += 1
  select1 = false
  while select1 == false
    cell = gets.chomp.to_i
    select1 = cell_check(cell, @p1, arr1, arr2)
  end
  board[cell - 1] = 'X'
  display_board(board)
  puts
  puts
  param1 = checklist.get_param1(arr1)

  winner = checklist.check_win(param1, param2)

  if winner == true
    puts "Congratulations,#{@p1} wins the game!"
    puts
    puts 'GAME OVER'
    break
  end

  if turn == 9
    puts 'This game has ended in a TIE!'
    puts
    puts 'GAME OVER'
    break
  end

  puts "#{@p2}: Please choose a cell number "
  turn += 1
  select1 = false
  while select1 == false
    cell = gets.chomp.to_i
    select1 = cell_check(cell, @p2, arr1, arr2)
  end
  board[cell - 1] = 'O'
  display_board(board)
  puts
  puts
  param2 = checklist.get_param2(arr2)
  param2 = param2.flatten
  winner = checklist.check_win(param1, param2)

  next unless winner == true

  puts "Congratulations,#{@p2} wins the game!"
  puts
  puts 'GAME OVER'
  break
end
