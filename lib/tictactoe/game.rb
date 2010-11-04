module TicTacToe
  class Game
    def start
      puts "Do you want to be X or O?"
      human_marker = STDIN.gets.strip
      while !["X", "O"].include?(human_marker)
        human_marker = STDIN.gets.strip
      end
      @board = Board.new
      if human_marker == "X"
        @x = HumanPlayer.new(@board)
        @x.set_marker("X")
        @o = OPlayer.new(@board)
      else
        @o = HumanPlayer.new(@board)
        @o.set_marker("O")
        @x = XPlayer.new(@board)
      end
    end

    def play
      while !game_over
        @x.move
        @o.move unless game_over
      end
      if winner
        puts "#{winner} wins!"
      else
        puts "Draw!"
      end
    end

    def game_over
      winner || !@board.spaces.values.include?(" ")
    end

    def winner
      ((1..3).map { |i| check_row(i) || check_column(i) }.compact + [check_diagonals]).compact.first
    end

    def check_row(i)
      left = ((i-1)*3)+1
      row = left.upto(left+2).map { |index| @board.spaces[index.to_s]}
      uniq_row = row.uniq
      return uniq_row.first if uniq_row.size == 1 && uniq_row.first != " "
      nil
    end

    def check_column(i)
      column = (1..3).map { |index| @board.spaces[(i + ((index-1)*3)).to_s]}
      uniq_column = column.uniq
      return uniq_column.first if uniq_column.size == 1 && uniq_column.first != " "
      nil
    end

    def check_diagonals
      diagonals = [["1", "5", "9"], ["3", "5", "7"]]
      diagonals.each do |diagonal|
        d = (0..2).map { |index| @board.spaces[diagonal[index]]}
        uniq_d = d.uniq
        return uniq_d.first if uniq_d.size == 1 && uniq_d.first != " "
      end
      nil
    end
  end
end
