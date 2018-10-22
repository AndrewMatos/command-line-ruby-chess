require "./Piece"

class Rook < Piece

	 def posible_moves(vertice,arr,arren, white=false,king_test=false)
        #pos = [X,Y]

        posible_moves_add = lambda do |n,start|
            if !king_test
               if arr.include?(n)
                   break
                   elsif arren.include?(n)
                   @table.add_edge(start, n, 1 )
                   break
                   else
                   @table.add_edge(start, n, 1 )
               end
             else
             @table.add_edge(start, n, 1 )
             end
        end 
	 	start= vertice.name
        up = false
        down = false
        left = false 
        right = false
        i = 1
        until up  do
        	if start[0] + i <=7
        		n = [start[0] + i,@pos[1]]
        		posible_moves_add.call(n,start)
        	else 
            up = true
        	end 
        	i+=1
        end

        i = 1

        until right do
        	if start[1] + i <=7
        		n = [@pos[0],start[1] + i]
        	    posible_moves_add.call(n,start)
        	else 
            right = true
        	end 
        	i+=1
        end

        i = 1

        until down  do
        	if start[0] - i >=0
        		n = [start[0] - i, @pos[1]]
        	    posible_moves_add.call(n,start)
        	else 
            down = true
        	end 
        	i+=1
        end

        i = 1

        until left do
            if start[1] - i >= 0
        		n = [@pos[0],start[1] - i]
        	    posible_moves_add.call(n,start)
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