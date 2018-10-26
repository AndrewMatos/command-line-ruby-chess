require "./Piece"

describe Piece do

  before(:all) do 
  	@pi = Piece.new([1,2])
  	
  end
 
  it "has a position" do	
  	expect(@pi.pos).to eql([1,2])
  end

  it "has a table of all positions in vertice made with a Graph class " do
    expect(@pi.table.class).to eql(Graph)
  end

  describe "#moves_route" do
  	  it " gives an array  with the fastest route to a point " do
      expect(@pi.moves_route([1,5])).to eql([[1,2],[1,3],[1,4],[1,5]])
  	  end
  end

  describe "#move" do 
  	 it "gives the player the options of movement and ask if he wants to move" do
  	 	puts " your position is #{@pi.pos} "
  	 	expect(@pi.move).to eql(true)
  	 	puts "your position is now #{@pi.pos}" 
  	 	expect(@pi.move).to eql(true)
  	 	puts "your position is now #{@pi.pos}"
  	 end
  end
	
end