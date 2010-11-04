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

    def display
      puts "#{@spaces["1"] == " " ? "1" : @spaces["1"]}|#{@spaces["2"] == " " ? "2" : @spaces["2"]}|#{@spaces["3"] == " " ? "3" : @spaces["3"]}"
      puts "-+-+-"
      puts "#{@spaces["4"] == " " ? "4" : @spaces["4"]}|#{@spaces["5"] == " " ? "5" : @spaces["5"]}|#{@spaces["6"] == " " ? "6" : @spaces["6"]}"
      puts "-+-+-"
      puts "#{@spaces["7"] == " " ? "7" : @spaces["7"]}|#{@spaces["8"] == " " ? "8" : @spaces["8"]}|#{@spaces["9"] == " " ? "9" : @spaces["9"]}"
    end
  end
end
