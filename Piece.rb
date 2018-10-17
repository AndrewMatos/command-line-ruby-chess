require "./class_Graph"

class Piece 
    
	attr_accessor :pos, :table

	def initialize(pos=[0,0])
		#pos = [X,Y]
        @pos=pos
        @table=ntable
	end

    def move
        ind = @table.find_vertice(@pos)
        vertice = posible_moves(@table.vertices[ind])
        m = []
        vertice.neighbours.each do |element|
            if element
             m.push(element)
            end
        end
        m= m.map do |element|
            case element[1]
            when 0
                element[1]="A"
             when 1
                element[1]="B"
             when 2
                element[1]="C"
             when 3
                element[1]="D"
             when 4
                element[1]="E"
             when 5
                element[1]="F"
             when 6
                element[1]="G"
             when 7
                element[1]="H"
             end
        element  = element[1]+element[0].to_s
        end
        
        pos_choice(m)

    end

    def pos_choice(m)
       puts "you can move this piece to to #{m} where do you want to move?"
       choice = gets.chomp.upcase 
       if m.include?(choice)
       choice = choice.split("").reverse
       @pos =[choice[0].to_i,to_pos(choice[1])]
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

    def posible_moves(vertice)

    end

    def ntable
     n =Graph.new
     i = 0
         while i<=7
         j = 0
            while j<=7
                n.add_vertex([i,j])
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
 

    def moves_route(start, move)

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
    puts "you can go there in #{path.length} steps:"
    p path
     
    end
     

end