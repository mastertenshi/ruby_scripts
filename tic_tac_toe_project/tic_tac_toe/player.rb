module TicTacToe
  class Player
    attr_accessor :position
    attr_reader :name, :sign

    def initialize(name = 'P1', sign = 'N')
      @name = name
      @sign = sign
      @position = 0
    end
  end
end
