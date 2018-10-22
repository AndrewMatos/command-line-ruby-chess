class Vertex
	attr_accessor :name, :neighbours, :weight
	
	def initialize(name)
		@name= name
		@neighbours=[]		
		@weight=[]	
	end

end

class Graph
	attr_accessor :vertices

	def initialize
		@vertices =[]
	end

	def add_vertex(name)
		@vertices.push(Vertex.new(name))
	end

	def find_vertice(name)
		@vertices.each_with_index do |element,index|
			if element.name == name
				return index
			end
		end
	nil
	end

	def count
		@vertices.length
	end

	def add_edge(vertex1, vertex2, weight=nil, unidirectional = true)
        a = @vertices.index{|element| element.name == vertex1}
        #puts "a= #{a}"
        b = @vertices.index{|element| element.name == vertex2}
       #puts "b =#{b}"
        @vertices[a].neighbours[b]=vertex2

       # p @vertices[a].neighbours
        if weight 
        	@vertices[a].weight[b]=weight
        end
        if unidirectional
        	@vertices[b].neighbours[a]=vertex1
        	@vertices[b].weight[a]=weight
        end
	end
end