module TicTacToe
  class XPlayer
    def initialize(board)
      @board = board
    end

    def move
      if @board.empty?
        corners = ["1", "3", "7", "9"]
        @board.move(corners[rand(4)], "X")
      end
    end
  end
end
