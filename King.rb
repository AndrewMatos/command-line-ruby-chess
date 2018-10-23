require "./Piece"

class King < Piece


	def posible_moves(vertice,arr=[],arren=[],white=false,king_test=false)
        #pos = [X,Y]
	 	start = vertice.name 
        i = 1

        	if start[0] + i <=7 && start[1] + i <=7 
        		n = [start[0] + i,start[1] + i]
        		if !arr.include?(n)
                @table.add_edge(start, n, 1 )
                end
        	end 
       

        	if start[0] + i <=7 && start[1] - i >=0
        		n = [start[0] + i, start[1] - i]
        	    if !arr.include?(n)
                @table.add_edge(start, n, 1 )
                end
        	
        	end 


          if   start[0] - i >= 0 && start[1] + i <=7 
        		n = [start[0] - i ,start[1] + i]
        	    if !arr.include?(n)
                @table.add_edge(start, n, 1 )
                end
          end 
    

          if  start[0] - i >= 0 &&  start[1] - i >= 0 
        		n = [start[0] -i  ,start[1] - i]
        	    if !arr.include?(n)
                @table.add_edge(start, n, 1 )
                end
          end 
        
       
          if start[0] + i <=7
        		n = [start[0] + i,@pos[1]]
        		if !arr.include?(n)
                @table.add_edge(start, n, 1 )
                end
          end 
        	

        	if start[1] + i <=7
        		n = [@pos[0],start[1] + i]
                if !arr.include?(n)
                @table.add_edge(start, n, 1 )
                end
        	end 

        	if start[0] - i >=0
        		n = [start[0] - i, @pos[1]]
        	    if !arr.include?(n)
                @table.add_edge(start, n, 1 )
                end
        	end 

        	if start[1] - i >= 0
        		n = [@pos[0],start[1] - i]
        	    if !arr.include?(n)
                @table.add_edge(start, n, 1 )
                end
        	end 
            
     return vertice
	 end
end

#k = King.new

#k.move

#p k.string_pos