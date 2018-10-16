class Board
    attr_accessor :table
	def initialize
      @table=[[],[],[],[],[],[],[],[]]
      @table.each do |element|
      	 i = 0 
      	 while i<=6 do
      	 	element.push(" ")
      	 	i+=1
      	 end
      end
	end

	def white_middle(var)
     return "║ #{var} ║"
	end

	def black_middle(var)
     return "┃ #{var} ┃"
	end
    
    def row(arr,row ,startwhite=false)
    	wob=startwhite
    	white_top ="╔═══╗"
        white_bottom ="╚═══╝"  
        black_top ="┏━━━┓"
        black_bottom ="┗━━━┛"
        i = 0 
    	top =" "

    	middle ="#{row}"
    	bottom =" "

      	 while i<=7 do
      	 	if wob
      	 	top+=white_top
      	 	middle+=white_middle(arr[i][row])
      	 	bottom+=white_bottom
      	 	wob = false
      	 	else 
      	 	top+=black_top
      	 	middle+=black_middle(arr[i][row])
      	 	bottom+=black_bottom
      	 	wob = true
      	 	end
      	 	i+=1
      	 end
      	 puts top
      	 puts middle
      	 puts bottom
      	 if row==0
      	 pos ="   A  "+"  B  "+"  C  "+"  D  "+"  E  "+"  F  "+"  G  "+"  H  "
         puts pos
      	 end
    end

	def put_board
		system "clear" or system "cls"
		i = 6
		n = false
		while i>=0 do
		  if n == false
		    row(@table,i)
		    n = true
		    else
		    row(@table,i,n)
		    n = false 
		  end
	    i-=1
	    end
	end

end

#b=Board.new

#b.put_board
