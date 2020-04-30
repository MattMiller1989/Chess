class Move
    attr_reader :piece

    
    def initialize(input,board)
        @board=board
        @piece = get_piece(input[0..1])
        # @end_point=get_end(input[2..3])
        # puts piece
    end
    def get_piece(loc_string)
        num_form=convert_to_grid_form(loc_string)
        @x=num_form[0]
        @y=num_form[1]
        # puts "@x:#{@x} @y:#{@y} loc_string: #{loc_string}"
        return @board[@x][@y]
    end
    def convert_to_grid_form(loc_string)
        x= loc_string[1].to_i
        y= loc_string[0]
        letters =['a','b','c','d','e','f','g','h']
        x=8-x
        y=letters.index(y)
        
        # puts "y :#{y} x:#{x}"
        return [x,y]
         
    end
end