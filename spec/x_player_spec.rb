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

  it "plays its second move in the corner if O plays a corner" do
    @board.move("1", "X")
    @board.move("3", "O")
    @player.move
    spaces = @board.spaces
    (spaces["7"] + spaces["9"]).strip.should == "X"
  end

  it "plays its second move in the opposite corner if O plays the center" do
    @board.move("1", "X")
    @board.move("5", "O")
    @player.move
    spaces = @board.spaces
    spaces["9"].should == "X"
  end

  it "plays its second move in the center if O plays an edge" do
    @board.move("1", "X")
    @board.move("8", "O")
    @player.move
    spaces = @board.spaces
    spaces["5"].should == "X"
  end

  it "wins if there's a row available to win" do
    @board.move("1", "X")
    @board.move("5", "O")
    @board.move("3", "X")
    @board.move("7", "O")
    @player.move
    spaces = @board.spaces
    spaces["2"].should == "X"
  end

  it "wins if there's a column available to win" do
    @board.move("1", "X")
    @board.move("5", "O")
    @board.move("4", "X")
    @board.move("8", "O")
    @player.move
    spaces = @board.spaces
    spaces["7"].should == "X"
  end

  it "wins if there's a diagonal available to win" do
    @board.move("3", "X")
    @board.move("4", "O")
    @board.move("5", "X")
    @board.move("8", "O")
    @player.move
    spaces = @board.spaces
    spaces["7"].should == "X"
  end

  it "blocks if there's a row available for O to win" do
    @board.move("1", "X")
    @board.move("5", "O")
    @board.move("9", "X")
    @board.move("4", "O")
    @player.move
    spaces = @board.spaces
    spaces["6"].should == "X"
  end

  it "blocks if there's a column available for O to win" do
    @board.move("1", "X")
    @board.move("5", "O")
    @board.move("6", "X")
    @board.move("8", "O")
    @player.move
    spaces = @board.spaces
    spaces["2"].should == "X"
  end

  it "blocks if there's a diagonal available for O to win" do
    @board.move("2", "X")
    @board.move("5", "O")
    @board.move("6", "X")
    @board.move("7", "O")
    @player.move
    spaces = @board.spaces
    spaces["3"].should == "X"
  end

  it "blocks if there's a diagonal available for O to win" do
    @board.move("9", "X")
    @board.move("3", "O")
    @board.move("2", "X")
    @board.move("5", "O")
    @player.move
    spaces = @board.spaces
    spaces["7"].should == "X"
  end

  it "fills the non O adjacent corner if there are two available" do
    @board.move("9", "X")
    @board.move("6", "O")
    @board.move("5", "X")
    @board.move("1", "O")
    @player.move
    spaces = @board.spaces
    spaces["7"].should == "X"
  end

  it "fills the free corner if there is one available" do
    @board.move("9", "X")
    @board.move("1", "O")
    @board.move("3", "X")
    @board.move("6", "O")
    @player.move
    spaces = @board.spaces
    spaces["7"].should == "X"
  end
end
