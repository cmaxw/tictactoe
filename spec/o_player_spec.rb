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

  it "moves to kitty corner on X on an edge and a corner" do
    @board.move("1", "X")
    @board.move("5", "O")
    @board.move("6", "X")
    @player.move
    @board.spaces["9"].should == "O"
  end

  it "moves to an edge on X on two corners" do
    @board.move("1", "X")
    @board.move("5", "O")
    @board.move("9", "X")
    @player.move
    (1..4).map { |i| @board.spaces[(2*i).to_s]}.should include("O")
  end

  it "moves to boxed corner on X on two edges" do
    @board.move("2", "X")
    @board.move("5", "O")
    @board.move("4", "X")
    @player.move
    @board.spaces["1"].should == "O"
  end

  it "moves to an edge on X on two opposite edges" do
    @board.move("2", "X")
    @board.move("5", "O")
    @board.move("8", "X")
    @player.move
    (1..4).map { |i| @board.spaces[(2*i).to_s]}.should include("O")
  end
end
