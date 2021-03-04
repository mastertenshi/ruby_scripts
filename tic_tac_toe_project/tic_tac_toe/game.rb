module TicTacToe
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
      input = gets.chomp.downcase
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
