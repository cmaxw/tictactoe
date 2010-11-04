module TicTacToe
  class XPlayer < Player
    def initialize(board)
      super
      @me = "X"
      @opponent = "O"
    end

    def move
      case @board.moves
      when 0
        mark_random_corner
      when 2
        if corner
          mark_random_corner
        elsif @board.spaces["5"] == "O" #middle
          space = (10 - @board.spaces.index("X").to_i).to_s
          @board.move(space, "X")
        else #edge (not corner)
          @board.move("5", "X")
        end
      else
        win || block || mark_unbordered_corner || mark_random_corner || mark_random_edge
      end
    end
  end
end
