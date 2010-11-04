module TicTacToe
  class Player
    CORNERS = ["1", "3", "7", "9"]

    def initialize(board)
      @board = board
    end

    protected

    def win
      check(@me)
    end

    def block
      check(@opponent)
    end

    def check(side = @me)
      [1,2,3].each do |i|
        return true if check_row(i, side)
        return true if check_column(i, side)
      end
      return true if check_diagonals(side)
      nil
    end

    def mark_random_corner
      index = rand(4)
      (0..3).each do |i|
        space = CORNERS[(index+i)%4]
        if @board.spaces[space] == " "
          @board.move(space, @me)
          return true
        end
      end
      false
    end

    def mark_random_edge
      index = rand(4)
      (0..4).each do |i|
        space = (((index+i)*2)%8 + 2).to_s
        if @board.spaces[space] == " "
          @board.move(space, @me)
          return true
        end
      end
      false
    end

    def mark_kitty_corner
      CORNERS.each do |c|
        if @board.spaces[c] == @opponent
          kitty_corner = (10 - c.to_i).to_s
          @board.move(kitty_corner, @me)
          return
        end
      end
    end

    def mark_bordered_corner(marker = @opponent)
      if @board.spaces["1"] == " " && @board.spaces["2"] == marker && @board.spaces["4"] == marker
        @board.move("1", @me)
        return true
      end
      if @board.spaces["3"] == " " && @board.spaces["2"] == marker && @board.spaces["6"] == marker
        @board.move("3", @me) 
        return true
      end
      if @board.spaces["7"] == " " && @board.spaces["8"] == marker && @board.spaces["4"] == marker
        @board.move("7", @me) 
        return true
      end
      if @board.spaces["9"] == " " && @board.spaces["8"] == marker && @board.spaces["6"] == marker
        @board.move("9", @me)
        return true
      end
      return false
    end

    def mark_unbordered_corner
      mark_bordered_corner(" ")
    end

    def check_row(i, side = @me)
      left = ((i-1)*3)+1
      row = left.upto(left+2).inject("") { |memo, index| memo + @board.spaces[index.to_s]}
      if row.gsub(/\s/, "") == side*2
        @board.move((left + row.index(" ")).to_s, @me)
        return true
      end
      false
    end

    def check_column(i, side = @me)
      column = (1..3).inject("") { |memo, index| memo + @board.spaces[(i + ((index-1)*3)).to_s]}
      if column.gsub(/\s/, "") == side*2
        @board.move((i + (column.index(" ")*3)).to_s, @me)
        return true
      end
      false
    end

    def check_diagonals(side = @me)
      diagonals = [["1", "5", "9"], ["3", "5", "7"]]
      diagonals.each do |diagonal|
        d = (0..2).inject("") { |memo, index| memo + @board.spaces[diagonal[index]]}
        if d.gsub(/\s/, "") == side*2
          @board.move(diagonal[d.index(" ")], @me)
          return true
        end
      end
      false
    end

    def edge_and_corner
      corner && edge
    end

    def edge_and_edge
      edges.count(@opponent) == 2
    end

    def corner(side = @opponent)
      corners.include?(side)
    end

    def edge(side = @opponent)
      edges.include?(side)
    end

    def edges
      (1..4).map { |index| @board.spaces[(2*index).to_s]}
    end

    def corners
      CORNERS.map { |index| @board.spaces[index]}
    end
  end
end

