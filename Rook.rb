require "./Piece"

class Rook < Piece

	 def posible_moves(vertice,arr=[],arren=[],white=false,king_test=false)
        #pos = [X,Y]

        
	 	start= vertice.name
        up = false
        down = false
        left = false 
        right = false
        i = 1
        until up  do
        	if start[0] + i <=7
        		n = [start[0] + i,@pos[1]]
        		if !king_test
                  if arr.include?(n)
                   break
                  elsif arren.include?(n)                 
                   @table.add_edge(start, n, 1 )
                   
                     lup = true
                   break
                   else
                     @table.add_edge(start, n, 1 )
                   end
               else
               @table.add_edge(start, n, 1 )
               end
        	else 
            up = true
        	end 
        	i+=1
        end

        i = 1

        until right do
        	if start[1] + i <=7
        		n = [@pos[0],start[1] + i]
        	    if !king_test
                  if arr.include?(n)
                   break
                  elsif arren.include?(n)                 
                   @table.add_edge(start, n, 1 )
                   
                     right = true
                   break
                   else
                     @table.add_edge(start, n, 1 )
                   end
               else
               @table.add_edge(start, n, 1 )
               end
        	else 
            right = true
        	end 
        	i+=1
        end

        i = 1

        until down  do
        	if start[0] - i >=0
        		n = [start[0] - i, @pos[1]]
        	    if !king_test
                  if arr.include?(n)
                   break
                  elsif arren.include?(n)                 
                   @table.add_edge(start, n, 1 )
                   
                     down = true
                   break
                   else
                     @table.add_edge(start, n, 1 )
                   end
               else
               @table.add_edge(start, n, 1 )
               end
        	else 
            down = true
        	end 
        	i+=1
        end

        i = 1

        until left do
            if start[1] - i >= 0
        		n = [@pos[0],start[1] - i]
        	    if !king_test
                  if arr.include?(n)
                   break
                  elsif arren.include?(n)                 
                   @table.add_edge(start, n, 1 )
                   
                     left = true
                   break
                   else
                     @table.add_edge(start, n, 1 )
                   end
               else
               @table.add_edge(start, n, 1 )
               end
        	else 
            left = true
        	end 
        	i+=1
        end
       

        return vertice
	 end




end

#r=Rook.new

#r.move