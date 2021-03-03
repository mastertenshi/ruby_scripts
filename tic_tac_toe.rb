module TicTacToe
  class Board
    def initialize
      @grid = []
      @grid_number_map = {}
      set_grids
    end

    def draw_board
      system 'clear'
      puts "\v"

      # "\e[34m"  # set format (blue foreground)
      # "\e[0m"   # clear format

      @grid.each_with_index do |array, index|
        string = "\t"

        array.each do |n|
          string += " \e[34m#{n}\e[0m "
          string += '|' unless (n % 3).zero?
        end
        puts string[0, string.length]
        puts "\t---+---+---" unless index == 2
      end
      puts "\v"

    end

    private

    def set_grids
      num = 1

      (0..2).each do |i|
        @grid.push([])

        (0..2).each do |k|
          @grid[i].push(num)
          @grid_number_map[num] = [i, k]
          num += 1
        end
      end
    end
  end


  # class Player
  #   def initialize(name = 'Player', symbol = '')
  #     @name = name
  #     @symbol = symbol
  #   end
  # end
end

board = TicTacToe::Board.new

board.draw_board

# p ([1, 5, 3, 7, 2, 5] & [1, 7, 5]).count
