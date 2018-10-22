require "./test_board"

class Game

	attr_accessor :board

	def initialize
		@board = Tboard.new
	end
   
    def play
    until win do
     
     white_play
     black_play
    end
     @board.put_board
    end

    def white_play
	    @board.put_board
	    if check(@board.wking.pos,true)
     	puts "white king is in check!!!"
        end
	   	puts "your turn WHITE player, choose wich piece to move , write the number of the piece you can move (write 'skip' to skip turn): "
	    avaible_pieces(true)
	    begin 
	    choice=gets.chomp.upcase 
		    if choice != "SKIP"
		     move_piece(choice,true)
		    end
		rescue TypeError
			puts "there is not piece with that name , press start to try again"
			gets
			white_play
		end
    end

    def black_play
	    @board.put_board
	     if check(@board.bking.pos,false)
         puts "black king is in check!!!"
         end
	    puts "your turn BLACK player, choose wich piece to move , write the number of the piece you can move (write 'skip' to skip turn): "
	    avaible_pieces(false)
	    begin
	    choice=gets.chomp.upcase 
	     if choice != "SKIP"
		     move_piece(choice,false)
		 end
		rescue TypeError
			puts "there is not piece with that name , press start to try again"
			gets
			black_play
		end
    end

    def check(king,white = false,king_test=false)
    n = false
    	if white
    		@board.blacks.each do |element|
              ind = element.table.find_vertice(element.pos)
              vertice = element.posible_moves(element.table.vertices[ind],@board.bpos,@board.wpos,white)
              if vertice.neighbours.include?(king)                 	 
              	#p "#{element.pos}:#{element.class}"
              	n = true
              	element.table=element.ntable
              	break
              end
    		end
    	else
    		@board.whites.each do |element|
              ind = element.table.find_vertice(element.pos)
              vertice = element.posible_moves(element.table.vertices[ind],@board.wpos,@board.bpos,white)
              if vertice.neighbours.include?(king)
                #  p "#{element.pos}:#{element.class}"
              	  n = true
              	  element.table=element.ntable
              	  break
              	 
              end
    		end
    	end
    return n	
    end

    def win
    	return false
    end

    def checkmate
    	puts "CHECKMATE MOTHERFUCKER!"
    end

   def avaible_pieces(white=false)
   	 str=""
   	 if white
	   	 @board.whites.each do |element|
	   	 	str+="#{element.string_pos}:#{element.class}  "
	   	 end

   	 else 
	   	  @board.blacks.each do |element|
	   	 	str+="#{element.string_pos}:#{element.class}  "
	   	 end
   	 end
   	 puts str + "\n"
   end

   def move_piece(choice, white = false)
	   	choice = [to_pos(choice[0]),choice[1].to_i]
        if @board.table[choice[0]][choice[1]].class == King
         move_king(@board.table[choice[0]][choice[1]],white) 
        else 
		 pos_change(choice,white)
		end
   end

   def  pos_change(choice,white,king=false)
         	if white
	            
				   if king || @board.table[choice[0]][choice[1]].move(@board.wpos,@board.bpos,true)
					   	if @board.blacks.include?(@board.table[@board.table[choice[0]][choice[1]].pos[0]][@board.table[choice[0]][choice[1]].pos[1]])
					   
					   	eats(@board.table[@board.table[choice[0]][choice[1]].pos[0]][@board.table[choice[0]][choice[1]].pos[1]] , white)
					   	end 
					    normal_move(choice,white)
					else 
				    white_play 
					end 
			else 
				
				if king || @board.table[choice[0]][choice[1]].move(@board.bpos,@board.wpos,false)
				   	if @board.whites.include?(@board.table[@board.table[choice[0]][choice[1]].pos[0]][@board.table[choice[0]][choice[1]].pos[1]])
				   	eats(@board.table[@board.table[choice[0]][choice[1]].pos[0]][@board.table[choice[0]][choice[1]].pos[1]] , white)
				   	end
                    normal_move(choice,white)
				else 
				black_play
				end
            end
   end

   def normal_move(choice,white = false)
   	  @board.table[@board.table[choice[0]][choice[1]].pos[0]][@board.table[choice[0]][choice[1]].pos[1]] = @board.table[choice[0]][choice[1]] 
      
      if white
      	index1 = @board.wpos.index(choice)
      	@board.wpos=@board.wpos[0...index1]+@board.wpos[index1+1..-1]
      	@board.wpos.push(@board.table[choice[0]][choice[1]].pos)
      else
      	index1 = @board.bpos.index(choice)
      	@board.bpos=@board.bpos[0...index1]+@board.bpos[index1+1..-1]
      	@board.bpos.push(@board.table[choice[0]][choice[1]].pos)
      end
      @board.table[choice[0]][choice[1]] = @board.bs
   end

   def move_king(king,white)
   	   ind = king.table.find_vertice(king.pos)
   	   if white
       k = king.posible_moves(king.table.vertices[ind],@board.wpos,@board.bpos,white)
       else
       k = king.posible_moves(king.table.vertices[ind],@board.bpos,@board.wpos,white)
       end
      posible_m =[]
      k.neighbours.each do |element|
          if element
          	posible_m .push(element)
          end 
      end

      blocked_m =[]
      final_m =[]
      posible_m.each_with_index do |element,index|
         if check(element,white,true)
           blocked_m.push(element)
         else
           final_m.push(element)
         end
      end

	  if white && blocked_m == posible_m && check(@board.wking.pos,true)
	  	checkmate
	  elsif  blocked_m == posible_m && check(@board.bking.pos,false)
	  	checkmate
	  else

	  	if final_m.length ==0 
         puts " sorry, there not moves avaible for this piece , press start to choose another piece"
         gets
         white_play
        else 
	        strings_m = final_m.map do |element|
	        	element = king.string_pos(element)
	        end
	    old_pos = king.pos.dup
        king.pos_choice(strings_m)
        pos_change(old_pos,white,true)
        end       

	  end

   end

   



   def eats(eaten,white = false)
	  if white 
	  	index1 = @board.blacks.index(eaten)
	  	index2 = @board.bpos.index(eaten.pos)
	    @board.blacks=@board.blacks[0...index1]+@board.blacks[index1+1..-1]
	    @board.bpos=@board.bpos[0...index1]+@board.bpos[index1+1..-1]
	  else
	  	index1 = @board.whites.index(eaten)
	  	index2 = @board.wpos.index(eaten.pos)
	    @board.whites=@board.whites[0...index1]+@board.whites[index1+1..-1]
	    @board.wpos=@board.wpos[0...index1]+@board.wpos[index1+1..-1]
	  end
   end

   def to_pos(str)
        r= str.downcase
        case r
        when "a"
        r = 0
        when "b"
        r = 1
        when "c"
        r = 2
        when  "d"
        r = 3 
        when "e"
        r = 4
        when "f"
        r = 5
        when "g"
        r = 6
        when "h"
        r = 7
        end 
       return r   
    end


end

g= Game.new

g.play