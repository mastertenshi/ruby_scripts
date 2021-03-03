module TicTacToe
  class Board
    attr_accessor :grid

    def initialize(size_x = 3, size_y = 3)
      @grid = []
      @grid_hash = {}
      set_grids(size_x, size_y)
    end

    def print
      p @grid
      p @grid_hash
    end

    private

    def set_grids(x, y)
      num = 1

      for i in 0...x
        @grid.push([])
        for k in 0...y
          @grid[i].push(num)
          @grid_hash[num] = [i, k]
          num += 1
        end
      end
    end
  end

  class Player
    def initialize(name = 'Player', symbol = '')
      @name = name
      @symbol = symbol
    end
  end
end

system 'clear'
puts " X | 2 | 3 "
puts "---+---+---"
puts " O | 5 | X "
puts "---+---+---"
puts " O | X | O "
puts ""
board = TicTacToe::Board.new

board.print
# p ([1, 5, 3, 7, 2, 5] & [1, 7, 5]).count

number_grid = {}

num = 1

for i in 0..2
  for k in 0..2
    number_grid[num] = [i, k]
    num += 1
  end
end
