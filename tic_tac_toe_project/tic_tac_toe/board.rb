module TicTacToe
  class Board
    def initialize
      @grid = []
      set_grid
    end

    def draw_board
      system 'clear'
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

    def set_cell(num, sign)
      num -= 1
      @grid[num / 3][num % 3] = sign
    end

    def get_row(pos)
      idx = (pos - 1) / 3
      row = []

      (0..2).each do |i|
        row.push(@grid[idx][i])
      end

      row
    end

    def get_column(pos)
      idx = (pos - 1) % 3
      column = []

      (0..2).each do |i|
        column.push(@grid[i][idx])
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
      diagonal = []
      (0..2).each do |i|
        diagonal.push(@grid[i][i])
      end
      diagonal
    end

    def diagonal_rtl
      diagonal = []
      (0..2).each do |i|
        k = i - 2
        k *= -1 unless k.positive?
        diagonal.push(@grid[i][k])
      end
      diagonal
    end

    private

    def set_grid
      num = 1

      (0..2).each do |i|
        @grid.push([])
        3.times do
          @grid[i].push(num)
          num += 1
        end
      end
    end
  end
end
