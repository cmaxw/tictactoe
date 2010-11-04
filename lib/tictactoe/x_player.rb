module TicTacToe
  class XPlayer
    CORNERS = ["1", "3", "7", "9"]

    def initialize(board)
      @board = board
      @spaces = []
    end

    def move
      case @board.moves
      when 0
        space = CORNERS[rand(4)]
        @spaces << space
        @board.move(space, "X")
      when 2
        if o_in_corner?
          CORNERS.each do |corner|
            if @board.spaces[corner] == " "
              @board.move(corner, "X") 
              break
            end
          end
        elsif @board.spaces["5"] == "O" #middle
          space = (10 - @board.spaces.index("X").to_i).to_s
          @board.move(space, "X")
        else #edge (not corner)
          @board.move("5", "X")
        end
      else
        win || block || mark_last_corner
      end
    end

    def win
      check
    end

    def block
      check("O")
    end

    def check(side = "X")
      [1,2,3].each do |i|
        return true if check_row(i, side)
        return true if check_column(i, side)
      end
      return true if check_diagonals(side)
      nil
    end

    def mark_last_corner
      corners = (0..3).inject("") { |memo, i| memo + @board.spaces[CORNERS[i]] }
      if corners.count(" ") == 1
        @board.move(CORNERS[corners.index(" ")], "X")
      else
        CORNERS.each do |corner|
          if @board.spaces[corner] == " "
            case corner
            when "1"
              if @board.spaces["2"] == " " && @board.spaces["4"] == " "
                @board.move("1", "X")
                return
              end
            when "3"
              if @board.spaces["2"] == " " && @board.spaces["6"] == " "
                @board.move("3", "X")
                return
              end
            when "7"
              if @board.spaces["4"] == " " && @board.spaces["8"] == " "
                @board.move("7", "X")
                return
              end
            when "9"
              if @board.spaces["8"] == " " && @board.spaces["6"] == " "
                @board.move("9", "X")
                return
              end
            end
          end
        end
      end
    end

    private

    def check_row(i, side = "X")
      left = ((i-1)*3)+1
      row = left.upto(left+2).inject("") { |memo, index| memo + @board.spaces[index.to_s]}
      if row.gsub(/\s/, "") == side*2
        @board.move((left + row.index(" ")).to_s, "X")
        return true
      end
      false
    end

    def check_column(i, side = "X")
      column = (1..3).inject("") { |memo, index| memo + @board.spaces[(i + ((index-1)*3)).to_s]}
      if column.gsub(/\s/, "") == side*2
        @board.move((i + (column.index(" ")*3)).to_s, "X")
        return true
      end
      false
    end

    def check_diagonals(side = "X")
      diagonals = [["1", "5", "9"], ["3", "5", "7"]]
      diagonals.each do |diagonal|
        d = (0..2).inject("") { |memo, index| memo + @board.spaces[diagonal[index]]}
        if d.gsub(/\s/, "") == side*2
          @board.move(diagonal[d.index(" ")], "X")
          return true
        end
      end
      false
    end

    def o_in_corner?
      cv = CORNERS.inject("") { |memo, index| memo + @board.spaces[index]}
      cv.include?("O")
    end
  end
end
