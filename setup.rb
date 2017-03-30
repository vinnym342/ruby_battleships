class Setup
  def self.text
    player_one_font = (Artii::Base.new :font => 'univers')
    player_ones_turn_text = (player_one_font.asciify('Player 1\'s Turn').colorize(:red))

    player_one_font = (Artii::Base.new :font => 'univers')
    player_twos_turn_text = (player_one_font.asciify('Player 2\'s Turn').colorize(:blue))

    continue_font = (Artii::Base.new :font => 'univers')
    continue_text = continue_font.asciify('Press Enter to continue').colorize(:yello)

    no_cheating_font = (Artii::Base.new :font => 'colossal')
    no_cheating_text = no_cheating_font.asciify('No Cheating!!!').colorize(:color => :black, :background => :white)

    return player_ones_turn_text,player_twos_turn_text,continue_text,no_cheating_text
  end
  def self.start_board
    rows = []
    # rows << ['X','A','B','C','D','E','F','G','I','J']
    for k in 1..9
      space = '*'
      # .colorize(:yellow)
      rows << [k,space,space,space,space,space,space,space,space,space]
      rows << :separator
    end
    rows << ['X','A','B','C','D','E','F','G','I','J']
  end

  def self.board(table,title)

    Plotting.print_board(table,title)

    puts "You can put down \n1, two length\ntwo, three length\n1, four length\n1,five length"

    for length in 2..5

      case length
      when 2
        num_of_ships = 1
      when 3
        num_of_ships = 2
      when 4
        num_of_ships = 1
      when 5
        num_of_ships = 1
      end

      for k in 1..num_of_ships
        # Make so that you can rotate real-time
        while true
          print "1.Horizontal 2.Vertical?:"
          direction = STDIN.getch.to_i; print direction
          puts ""
          break if direction == 1 || direction == 2
          system 'clear'
          Plotting.print_board(table,title)
          puts 'Please type either 1 or 2'
        end

        # print "Which y value?:"
        # y_start = STDIN.getch.to_i; print y_start
        # puts ""
        #
        # print "Which x value?:"
        # x_start= STDIN.getch.to_i; print x_start
        # puts ""

        x_start = 5
        y_start = 5


        mover = ''
        puts "You're placing a #{length} long ship"
        puts "Please usei,j,k,l keys as arrow keys"
        case direction

        when 1 #Horizontal
          while mover != '/'
            mover = STDIN.getch
            case mover
            when 'i'
              y_start -= 1 if y_start > 1

            when 'k'
              y_start += 1 if y_start < 9

            when 'j'
              x_start -= 1 if x_start > 1

            when 'l'
              x_start += 1 if x_start < 10 - length

            else
              next
            end
            puts ""
            # position_table = []
            # table.each do |row|
            #   position_table << row.clone
            # end
            position_table = table.map { |row| row.clone}
            puts ""
            position_table = Plotting.battleship_horizontal(x_start,y_start,length,position_table)
            Plotting.print_board(position_table,title)
          end

          when 2 # Vertical
            while mover != '/'
              mover = STDIN.getch
              case mover
              when 'i'
                y_start -= 1 if y_start > 0

              when 'k'
                y_start += 1 if y_start < 10 - length

              when 'j'
                x_start -= 1 if x_start > 1

              when 'l'
                x_start += 1 if x_start < 9

              else
                next
              end
              puts ""
              # position_table = []
              # table.each do |row|
              #   position_table << row.clone
              # end
              position_table = table.map { |row| row.clone}
              puts ""
              position_table = Plotting.battleship_vertical(x_start,y_start,length,position_table)
              Plotting.print_board(position_table,title)
            end

          end

          table = position_table
        end

      end
      return position_table
    end
  end
