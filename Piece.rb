require "./class_Graph"

class Piece 

	attr_accessor :pos, :table

	def initialize(pos=[0,0])
		#[X,Y]
        #pos = [X,Y]
        @pos=pos
        @table=ntable
	end

    def posible_moves(vertice,arr=[],arren=[])
        start = vertice.name
        if start[1] + 1 <=7
            n = [@pos[0],start[1] + 1]
            if !arr.include?(n)
             @table.add_edge(start, n, 1 )
            end
        end
        return vertice
    end

    def move(arr=[],arren=[])
        ind = @table.find_vertice(@pos)
        vertice = posible_moves(@table.vertices[ind],arr,arren)
        m = []
        vertice.neighbours.each do |element|
            if element
             m.push(element)
            end
        end

        m= m.map do |element|
            case element[0]
            when 0
                element[0]="A"
             when 1
                element[0]="B"
             when 2
                element[0]="C"
             when 3
                element[0]="D"
             when 4
                element[0]="E"
             when 5
                element[0]="F"
             when 6
                element[0]="G"
             when 7
                element[0]="H"
             end
        element  = element[0]+element[1].to_s
        end
        @table=ntable   
        pos_choice(m)

    end

    def pos_choice(m)
       puts "you can move this piece to to #{m} where do you want to move?"
       choice = gets.chomp.upcase 
       if m.include?(choice)
       choice = choice.split("")
       @pos =[to_pos(choice[0]),choice[1].to_i,]
       else
        puts "invalid, try again"
        pos_choice(m)
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


    def ntable
     n =Graph.new
     i = 0
         while i<=7
         j = 0
            while j<=7
                n.add_vertex([j,i])
                j+=1
            end
         i+=1
         end
    return n
    end

    def connection      
         m = @table.vertices.map do |element|
          element= posible_moves(element)
        end        
    end
 

    def moves_route( move, start=@pos)

     connection
     fin = false
     n =[]
     ni =[]
     n.push(start)
     i=0
     until fin

             m = @table.find_vertice(start)

            if @table.vertices[m].neighbours.include?(move) || n[0][0]== move[0] && n[0][1]== move[1]
                ni.push(n.shift) 
                ni.push(move)
                fin = true
            break

            else

                 @table.vertices[m].neighbours.each_with_index do |element,index| 
                    if element && !ni.include?(element)
                      n.push(element)
                    end
                 end

                 ni.push(n.shift) 
                 start=n[0]   
                 
             end
                       
         
     end
    

    ni.reverse!
    path=[]
    path.push(ni[0])
    ni.each do |element|
      if @table.vertices[@table.find_vertice(path[-1])].neighbours.include?(element)
        path.push(element)
      end
    end
    path.reverse!
    @table=ntable
    puts "you can go there in #{path.length} steps:"
    p path
     
    end
     

end