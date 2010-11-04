module TicTacToe
  class HumanPlayer < Player
    def set_marker(marker)
      @me = marker
    end

    def move
      @board.display
      puts "\nChoose a space:"
      begin
        @board.move(STDIN.gets.strip, @me)
      rescue InvalidSpaceError
        puts $!.message
        self.move
      rescue InvalidMarkerError
        puts $!.message
        self.move
      rescue OccupiedSpaceError
        puts $!.message
        self.move
      end
    end
  end
end

