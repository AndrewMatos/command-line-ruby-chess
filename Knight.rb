require "./Piece"

class Knight < Piece
	

    def posible_moves(vertice, arr,arren, white=false,king_test=false)

        start= vertice.name

        if start[0]+1 <=7 &&  start[1]+2 <=7
            n = [start[0]+1,start[1]+2]
            if !arr.include?(n)      
            @table.add_edge(start, n, 1 )
            end
        
        end

        if start[0]+2 <=7 &&  start[1]+1 <=7
            n = [start[0]+2,start[1]+1]
            if !arr.include?(n)      
            @table.add_edge(start, n, 1 )
            end
        end

        if start[0]-1>=0 && start[1]+2 <=7
            n = [start[0]-1,start[1]+2]
            if !arr.include?(n)      
            @table.add_edge(start, n, 1 )
            end
        end
         
        if start[0]-2>=0 && start[1]+1 <=7
            n = [start[0]-2,start[1]+1]
            if !arr.include?(n)      
            @table.add_edge(start, n, 1 )
            end
        end

        if start[0]-2>=0 && start[1]-1 >=0
            n = [start[0]-2,start[1]-1]
            if !arr.include?(n)      
            @table.add_edge(start, n, 1 )
            end
        end

        if start[0]-1>=0 && start[1]-2 >=0
            n = [start[0]-1,start[1]-2]
            if !arr.include?(n)      
            @table.add_edge(start, n, 1 )
            end
        end

        if start[0]+1<=7 && start[1]-2 >=0
            n = [start[0]+1,start[1]-2]
            if !arr.include?(n)      
            @table.add_edge(start, n, 1 )
            end
        end

        if start[0]+2<=7 && start[1]-1 >=0
            n = [start[0]+2,start[1]-1]
            if !arr.include?(n)      
            @table.add_edge(start, n, 1 )
            end
        end

        return vertice

    end

    

end






