module TicTacToe
  class InvalidSpaceError < ArgumentError; end
  class InvalidMarkerError < ArgumentError; end
  class OccupiedSpaceError < StandardError; end

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
      raise InvalidSpaceError, "You may only play on spaces 1-9." unless space.match(/^[1-9]$/)
      raise InvalidMarkerError, "You may only play as X or O." unless x_o.match(/^[XO]$/)
      raise OccupiedSpaceError, "That space is taken." unless @spaces[space] == " "

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
