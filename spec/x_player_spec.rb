require 'spec_helper'

describe TicTacToe::XPlayer do
  before(:each) do
    @board = TicTacToe::Board.new
    @player = TicTacToe::XPlayer.new(@board)
  end

  it "should put the first move in a corner" do
    spaces = @board.spaces
    @player.move
    (spaces["1"] + spaces["3"] + spaces["7"] + spaces["9"]).strip.should == "X"
  end
end
