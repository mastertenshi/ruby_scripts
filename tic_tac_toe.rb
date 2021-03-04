require 'colorize'

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
          # Colorize output
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

  class Player
    attr_reader :name, :sign

    def initialize(name = 'P1', sign = 'N')
      @name = name
      @sign = sign
    end
  end

  class Game
    def initialize
      @player1 = Player.new('Player1'.red, 'X')
      @player2 = Player.new('Player2'.blue, 'O')
      @board = Board.new
      @taken_positions = []
    end

    def win?(pos, sign)
      return true if @board.get_column(pos).all?(sign)
      return true if @board.get_row(pos).all?(sign)

      if pos.odd?
        if [1, 9].include?(pos)
          return true if @board.diagonal('ltr').all?(sign)
        else
          return true if @board.diagonal('rtl').all?(sign)
        end
      end

      false
    end

    def play
      turns_count = 0
      player = @player1

      win = false

      while turns_count < 9
        pos = prompt_position(player)
        @board.set_cell(pos, player.sign)
        @taken_positions.push(pos)

        win = win?(pos, player.sign) unless turns_count < 4
        break if win

        player = (player == @player1) ? @player2 : @player1

        turns_count += 1
      end

      @board.draw_board

      win ? game_win(player) : game_draw
    end

    private

    def game_draw
      puts "It's a draw!"
      play_again
    end

    def game_win(player)
      puts "Congratz #{player.name} wins!!!"
      play_again
    end

    def play_again
      print "\nWanna play again? (y/n): "
      input = gets.chomp
      if %w[y yes].include?(input)
        initialize
        play
      end
    end

    def prompt_position(player = Player.new)
      @board.draw_board

      sign = (player.sign == 'X') ? player.sign.red : player.sign.blue
      puts "#{player.name}'s turn (#{sign})"
      print "\nEnter position number: "

      pos = 0

      # Until we get a valid position number
      loop do
        pos = gets.chomp
        exit if %w[exit quit].include?(pos)
        pos = pos.to_i
        if pos.between?(1, 9)
          break unless @taken_positions.include?(pos)

          puts "#{'Error! '.red} Position already played."
          print 'Try another position [1-9]: '
        else
          print "#{'Error! '.red} Enter number between [1-9]: "
        end
      end

      pos
    end
  end
end

game = TicTacToe::Game.new

game.play
