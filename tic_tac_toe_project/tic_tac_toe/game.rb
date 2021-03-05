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
      player = @player1

      win = false

      (0..8).each do |turns_count|
        pos = prompt_position(player)
        @board.set_cell(pos, player.sign)
        @taken_positions.push(pos)

        win = win?(pos, player.sign) unless turns_count < 4
        break if win

        player = (player == @player1) ? @player2 : @player1
      end

      win ? game_win(player) : game_tie
    end

    private

    def game_tie
      @board.draw

      puts "It's a tie!"

      play_again
    end

    def game_win(player)
      @board.draw

      puts "Congratz #{player.name} wins!!!"

      play_again
    end

    def play_again
      print "\nWanna play again? (y/n): "
      input = gets.chomp

      initialize and play if %W[y yes #{''}].include?(input.downcase)
      exit
    end

    def prompt_position(player = Player.new)
      @board.draw
      Display.player_turn(player)

      # Until we get a valid position number
      loop do
        pos = gets.chomp
        exit if %w[exit quit].include?(pos.downcase)

        pos = pos.to_i
        if pos.between?(1, 9)
          return pos unless @taken_positions.include?(pos)

          Display.position_taken
        else
          Display.not_a_number
        end
      end
    end
  end
end
