class Plotting

  def self.print_board(rows,title)
    system 'clear'
    table = Terminal::Table.new :title => title, :rows => rows
    puts table
  end

  def self.battleship_vertical(x_start,y_start,length,table)
    wanted_row_index = (y_start) * 2
    for k in 1..length
      wanted_row = table[wanted_row_index]
      wanted_row[x_start] = 'X'.colorize(:blue)
      wanted_row_index += 2
    end

    return table
  end

  def self.battleship_horizontal(x_start,y_start,length,table)
    wanted_row_index = (y_start - 1) * 2
    for k in 1..length
      board_row = table[wanted_row_index]
      board_row[x_start] = 'X'.colorize(:blue)
      x_start += 1
    end
    return table
  end
end
