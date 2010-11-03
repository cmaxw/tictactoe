module TicTacToe
  class Board
    attr_reader :spaces
    def initialize
      @spaces = { "1" => ' ',
        "2" => ' ',
        "3" => ' ',
        "4" => ' ',
        "5" => ' ',
        "6" => ' ',
        "7" => ' ',
        "8" => ' ',
        "9" => ' ' }
    end

    def move(space, x_o)
      @spaces[space] = x_o
    end

    def empty?
      @spaces.values.join.strip == ""
    end

    def moves
      spaces.values.join.gsub(/\s/, "").length
    end
  end
end
