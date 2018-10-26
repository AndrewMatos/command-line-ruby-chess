require "./Board"

#same as Board but made to test especific escenarios

class Tboard < Board

	 def put_white
=begin

     i = 0
     while i<=7 do
     n = Pawn.new([i,1],"\u2659")
     put_piece(n)
     i+=1
     end

=end

     n = Pawn.new([2,6],"\u2659")
     put_piece(n)
     n = Rook.new([0,0],"\u2656")
     put_piece(n)
     n = Rook.new([7,0],"\u2656")
     put_piece(n)
=begin
     n = Knight.new([1,0],"\u2658")
     put_piece(n)
     n = Knight.new([6,0],"\u2658")
     put_piece(n)
     n = Bishop.new([2,0],"\u2657")
     put_piece(n)
     n = Bishop.new([5,0],"\u2657")
     put_piece(n)
=end
     n = Queen.new([3,0],"\u2655")
     put_piece(n)
     n = King.new([4,0],"\u2654")
     put_piece(n,true)
  end

  def put_black
=begin
       i = 0
     while i<=7 do
     n = Pawn.new([i,6],"\u265F")
     put_piece(n)
     i+=1
     end
=end
     n = Pawn.new([5,1],"\u265F")
     put_piece(n)
     n = Rook.new([0,7],"\u265C")
     put_piece(n)
=begin
     n = Rook.new([7,7],"\u265C")
     put_piece(n)
     n = Knight.new([1,7],"\u265E")
     put_piece(n)
     n = Knight.new([6,7],"\u265E")
     put_piece(n)
     n = Bishop.new([2,7],"\u265D")
     put_piece(n)
     n = Bishop.new([5,7],"\u265D")
     put_piece(n)
=end
     n = Queen.new([3,7],"\u265B")
     put_piece(n)
     n = King.new([4,7],"\u265A")
     put_piece(n,true)
  end
end