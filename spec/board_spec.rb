require 'spec_helper'

describe TicTacToe::Board do
  before(:each) do
    @board = TicTacToe::Board.new
  end

  it "initializes to ' ' in each space" do
    @board.spaces["1"].should == ' '
    @board.spaces["2"].should == ' '
    @board.spaces["3"].should == ' '
    @board.spaces["4"].should == ' '
    @board.spaces["5"].should == ' '
    @board.spaces["6"].should == ' '
    @board.spaces["7"].should == ' '
    @board.spaces["8"].should == ' '
    @board.spaces["9"].should == ' '
  end

  it "places an X in the designated space on move" do
    @board.move("1", "X")
    @board.spaces["1"].should == 'X'
    @board.spaces["2"].should == ' '
    @board.spaces["3"].should == ' '
    @board.spaces["4"].should == ' '
    @board.spaces["5"].should == ' '
    @board.spaces["6"].should == ' '
    @board.spaces["7"].should == ' '
    @board.spaces["8"].should == ' '
    @board.spaces["9"].should == ' '    
  end

  it "places an O in the designated space on move" do
    @board.move("1", "O")
    @board.spaces["1"].should == 'O'
    @board.spaces["2"].should == ' '
    @board.spaces["3"].should == ' '
    @board.spaces["4"].should == ' '
    @board.spaces["5"].should == ' '
    @board.spaces["6"].should == ' '
    @board.spaces["7"].should == ' '
    @board.spaces["8"].should == ' '
    @board.spaces["9"].should == ' '    
  end

  it "should be empty if it's spaces are all empty" do
    @board.should be_empty
  end

  it "should not be empty if it's spaces are not all empty" do
    @board.move("1", "O")
    @board.should_not be_empty
  end

  it "#moves should return the number of filled spaces" do
    @board.move("1", "O")
    @board.moves.should == 1
    @board.move("2", "O")
    @board.moves.should == 2
    @board.move("4", "O")
    @board.moves.should == 3
  end

  it "raises errors on invalid space" do
    lambda { @board.move("0", "X") }.should raise_error(TicTacToe::InvalidSpaceError, "You may only play on spaces 1-9.")
  end

  it "raises errors on invalid marker" do
    lambda { @board.move("1", "F") }.should raise_error(TicTacToe::InvalidMarkerError, "You may only play as X or O.")
  end

  it "raises errors on move to an occupied space" do
    @board.move("1", "O")
    lambda { @board.move("1", "X") }.should raise_error(TicTacToe::OccupiedSpaceError, "That space is taken.")
  end
end
