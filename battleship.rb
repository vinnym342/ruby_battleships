require 'terminal-table'
require 'colorize'
require 'io/console'
require 'artii'
require 'highline'
require './setup'
require './plotting'
# require './game'

system 'clear'

player_ones_turn_text,player_twos_turn_text,continue_text,no_cheating_text = Setup.text

table_blank = Setup.start_board

table_ones_actual,table_twos_actual = []

puts player_ones_turn_text
puts
puts no_cheating_text
puts
puts continue_text
gets
while true
  table_ones_actual = Setup.board(table_blank,"Player 1's Board")
  while true
    Plotting.print_board(table_ones_actual,"Player One's Board")
    puts 'Are you happy with this board?'
    puts 'Please type either y or n'
    confirm = STDIN.getch.downcase
    break if confirm == 'y' || confirm == 'n'
  end

break if confirm == 'y'
next if confirm == 'n'

end
system 'clear'
puts player_twos_turn_text
puts
puts no_cheating_text
puts
puts continue_text
gets
while true
  table_twos_actual = Setup.board(table_blank,"Player Two's Board")
  while true
    Plotting.print_board(table_twos_actual,"Player Two's Board")
    puts 'Are you happy with this board?'
    puts 'Please type either y or n'
    confirm = STDIN.getch.downcase
    break if confirm == 'y' || confirm == 'n'
  end

break if confirm == 'y'
next if confirm == 'n'

end
 puts "Ready?!?!?!?!"
 Plotting.print_board(table_ones_actual,"Player 1's Board")
 gets
 Plotting.print_board(table_twos_actual,"Player 2's Board")
