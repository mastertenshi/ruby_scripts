module TicTacToe
  module Display
    def self.position_taken
      puts "#{'Error! '.red} Position already played."
      print 'Try another position [1-9]: '
    end

    def self.not_a_number
      print "#{'Error! '.red} Enter number between [1-9]: "
    end

    def self.player_turn(player)
      # Colorize X and O
      sign = (player.sign == 'X') ? player.sign.red : player.sign.blue

      puts "#{player.name}'s turn (#{sign})"
      print "\nEnter position number: "
    end
  end
end
