require 'terminal-table'
require 'colorize'
require 'io/console'
require 'artii'
require 'highline'
require './setup'
require './plotting'

table_blank = Setup.start_board
table_one_actual = Setup.board(table_blank,"Your Board")
