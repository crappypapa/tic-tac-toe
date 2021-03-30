#!/usr/bin/env ruby

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

def name_check(person)
  if person.length.zero?
    p "'Name' should not be blank"
    false
  else
    true
  end
end

puts 'Welcome to Tic-Tac-Toe v1.0'
puts 'Press Enter to continue_'
puts 'Welcome, player 1'
puts 'Please input your game name...'
select1 = false
while select1 == false
  p1 = gets.chomp
  select1 = name_check(p1)
end
puts
puts 'Welcome, player 2'
puts 'Please input your game name...'
select1 = false
while select1 == false
  p2 = gets.chomp
  select1 = name_check(p2)
end
puts
puts "#{p1} plays with 'X' and #{p2} plays with 'O'"
puts
puts 'INSTRUCTION!!!:Input the corresponding cell number in which you want to place your piece when prompted'
puts
puts 'Let us get right to it!'
puts
puts
# display_board(board)
puts
puts

def cell_check(cell, select1, arr)
  if arr.include? cell
    puts 'Cell position has been taken, select a new cell'
    select1
  elsif (1..9).include? cell
    arr << cell
    true

  else
    puts 'Invalid selection, Please enter a valid number between 1-9'
    select1
  end
end

arr = []
session = true
turn = 0
while session
  if turn <= 7
    display_board(board)
    puts "#{p1}: Please choose a cell number "
    select1 = false
    while select1 == false
      cell = gets.chomp.to_i
      select1 = cell_check(cell, select1, arr)
    end
    display_board(board)

    puts "#{p2}: Please choose a cell number "
    select1 = false
    while select1 == false
      cell = gets.chomp.to_i
      select1 = cell_check(cell, select1, arr)
    end
    turn += 2
  
    break
  end
end
