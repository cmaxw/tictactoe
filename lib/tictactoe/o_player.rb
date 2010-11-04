module TicTacToe
  class OPlayer < Player
    def initialize(board)
      super
      @me = "O"
      @opponent = "X"
    end

    def move
      case @board.moves
      when 1
        if @board.spaces["5"] == " "
          @board.move("5", "O")
        else
          mark_random_corner
        end
      when 3
        unless block
          if edge_and_corner
            mark_kitty_corner
          elsif edge_and_edge
            mark_bordered_corner || mark_random_edge
          else
            mark_random_edge
          end
        end
      else
        win || block || mark_random_corner || mark_random_edge
      end
    end
  end
end
