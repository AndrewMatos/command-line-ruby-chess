require "./Pawn"
require "./King"
require "./Queen"
require "./Bishop"
require "./Rook"
require "./Knight"

#class Blank space to simulate a piece and use symbol instace variable

class Blankspace
     attr_accessor :symbol

     def initialize
      @symbol = " "
     end

     def as_json(options={})
        {
            jclass: self.class.name,
            data: {
               symbol: symbol 
            }
        }
    end

    def to_json(*options)
        as_json(*options).to_json(*options)
    end
end

#class board that contains each object and position

class Board
    attr_accessor :table, :whites, :blacks , :wpos , :bpos , :bs, :wking , :bking , :wthreat , :bhreat
	def initialize(loadgame =false)
      @table=[[],[],[],[],[],[],[],[]]
      @bs = Blankspace.new
      @table.each do |element|
      	 i = 0 
      	 while i<=7 do
      	 	element.push(@bs)
      	 	i+=1
      	 end
      end
      @whites=[]
      @wpos =[]
      @blacks=[]
      @bpos=[]
      @wking=""
      @bking=""
      @wthreat=""
      @bhreat=""
      if !loadgame
      put_white
      put_black
      end
	end

# puts each of the white pieces

  def put_white
     i = 0
     while i<=7 do
     n = Pawn.new([i,1],"\u2659",true)
     put_piece(n)
     i+=1
     end
     n = Rook.new([0,0],"\u2656",true)
     put_piece(n)
     n = Rook.new([7,0],"\u2656",true)
     put_piece(n)
     n = Knight.new([1,0],"\u2658",true)
     put_piece(n)
     n = Knight.new([6,0],"\u2658",true)
     put_piece(n)
     n = Bishop.new([2,0],"\u2657",true)
     put_piece(n)
     n = Bishop.new([5,0],"\u2657",true)
     put_piece(n)
     n = Queen.new([3,0],"\u2655",true)
     put_piece(n)
     n = King.new([4,0],"\u2654",true)
     put_piece(n,true)
  end

#put each of black piece

  def put_black
       i = 0
     while i<=7 do
     n = Pawn.new([i,6],"\u265F",false)
     put_piece(n)
     i+=1
     end
     n = Rook.new([0,7],"\u265C",false)
     put_piece(n)
     n = Rook.new([7,7],"\u265C",false)
     put_piece(n)
     n = Knight.new([1,7],"\u265E",false)
     put_piece(n)
     n = Knight.new([6,7],"\u265E",false)
     put_piece(n)
     n = Bishop.new([2,7],"\u265D",false)
     put_piece(n)
     n = Bishop.new([5,7],"\u265D",false)
     put_piece(n)
     n = Queen.new([3,7],"\u265B",false)
     put_piece(n)
     n = King.new([4,7],"\u265A",false)
     put_piece(n,true)
  end

  #takes a n object(a piece) and puts in the table, in the whites and black arrays, the positions arrays, and in king specific instance variable

  def put_piece(n, king= false)
     
     if n.color
       @whites.push(n)
       if king
       @wking = n
       end
       @wpos.push(n.pos)
     else
       @blacks.push(n)
       if king
       @bking = n
       end
       @bpos.push(n.pos)
     end
     @table[n.pos[0]][n.pos[1]] = n
  end

  
#displays the piece in the middle of the square

	def white_middle(var)
     return "║ #{var} ║"
	end

	def black_middle(var)
     return "┃ #{var} ┃"
	end
  
  # createsa row using square
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
      	 	middle+=white_middle(arr[i][row].symbol)
      	 	bottom+=white_bottom
      	 	wob = false
      	 	else 
      	 	top+=black_top
      	 	middle+=black_middle(arr[i][row].symbol)
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
  # puts the square and table on display

	def put_board
		#system "clear" or system "cls"
    #system "clear" or system "cls"
		i = 7
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
  return ""
	end

  # methods for easy serialization using JSON

  def as_json(options={})
        {
            jclass: self.class.name,
            table: @table
        }
  end

  def to_json(*options)
        as_json(*options).to_json(*options)
  end
     


end

