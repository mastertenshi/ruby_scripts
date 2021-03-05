module TicTacToe
  class Board
    def initialize
      n = 0
      @grid = Array.new(3) { Array.new(3) { n += 1 } }
    end

    def draw
      system 'clear'
      puts "Enter 'exit' or 'quit' to leave the game."
      puts "\v"

      @grid.each_with_index do |row, index|
        row_str = "\t"

        row.each do |cell|
          # Colorize X and O
          if cell.is_a? String
            cell = (cell == 'X') ? cell.red.bold : cell.blue.bold
          end
          row_str += " #{cell} |"
        end

        puts row_str.chomp('|')
        puts "\t---+---+---" unless index == 2
      end

      puts "\v"
    end

    def set_cell(position, sign)
      n = position - 1
      @grid[n / 3][n % 3] = sign
    end

    def get_row(position)
      idx = (position - 1) / 3
      row = Array.new(3)
      row.each_index do |i|
        row[i] = @grid[idx][i]
      end
      row
    end

    def get_column(position)
      idx = (position - 1) % 3
      column = Array.new(3)
      column.each_index do |i|
        column[i] = @grid[i][idx]
      end
      column
    end

    def diagonal(direction)
      (direction == 'ltr') ? diagonal_ltr : diagonal_rtl

      ### Maybe?
      # return diagonal_ltr if direction == 'ltr'
      # return diagonal_rtl if direction == 'rtl'
      # throw Exception
    end

    def diagonal_ltr
      diagonal = Array.new(3)
      diagonal.each_index do |i|
        diagonal[i] = @grid[i][i]
      end
      diagonal
    end

    def diagonal_rtl
      diagonal = Array.new(3)
      diagonal.each_index do |i|
        k = i - 2
        k *= -1 unless k.positive?
        diagonal[i] = @grid[i][k]
      end
      diagonal
    end
  end
end
