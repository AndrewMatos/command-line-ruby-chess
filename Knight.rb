require "./Piece"

class Knight < Piece
	

    def posible_moves(vertice)

        start= vertice.name

        if start[0]+1 <=7 &&  start[1]+2 <=7
            n = [start[0]+1,start[1]+2]
            @table.add_edge(start, n, 1 )
        end

        if start[0]+2 <=7 &&  start[1]+1 <=7
            n = [start[0]+2,start[1]+1]
            @table.add_edge(start, n, 1 )
        end

        if start[0]-1>=0 && start[1]+2 <=7
            n = [start[0]-1,start[1]+2]
            @table.add_edge(start, n, 1 )
        end
         
        if start[0]-2>=0 && start[1]+1 <=7
            n = [start[0]-2,start[1]+1]
            @table.add_edge(start, n, 1 )
        end

        if start[0]-2>=0 && start[1]-1 >=0
            n = [start[0]-2,start[1]-1]
            @table.add_edge(start, n, 1 )
        end

        if start[0]-1>=0 && start[1]-2 >=0
            n = [start[0]-1,start[1]-2]
            @table.add_edge(start, n, 1 )
        end

        if start[0]+1<=7 && start[1]-2 >=0
            n = [start[0]+1,start[1]-2]
            @table.add_edge(start, n, 1 )
        end

        if start[0]+2<=7 && start[1]-1 >=0
            n = [start[0]+2,start[1]-1]
            @table.add_edge(start, n, 1 )
        end

        return vertice

    end

    

end



k =Knight.new()

#k.connection
k.move


