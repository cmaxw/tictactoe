require 'spec_helper'

describe TicTacToe::OPlayer do
  before(:each) do
    @board = TicTacToe::Board.new
    @player = TicTacToe::OPlayer.new(@board)
  end

  it "moves to the center on the first move if available" do
    @board.move("1", "X")
    @player.move
    @board.spaces["5"].should == "O"
  end

  it "moves to a corner on the first move if center is not available" do
    @board.move("5", "X")
    @player.move
    [@board.spaces["1"], @board.spaces["3"], @board.spaces["7"], @board.spaces["9"]].should include("O")
  end
end
