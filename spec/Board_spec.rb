require "./Board"

describe Board do 
    
    before(:all) do
    @b = Board.new
    end

    it "has an array with the positions of the pieces" do
     expect(@b.table.class).to eql(Array)
    end

    it "puts  the game board  in the console using strings" do
    	 expect(@b.put_board.class).to eql(String)
    end
	
end