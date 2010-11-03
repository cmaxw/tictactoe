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
end
