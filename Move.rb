class Move
    attr_reader :piece, :end_point

    
    def initialize(input,board)
        @board=board

        @piece = get_piece(input[0..1])
        #puts "@piece: #{@piece} class: #{@piece.class}"
        @end_point=get_end(input[2..3])

        
    end
    def get_piece(loc_string)
        num_form=convert_to_grid_form(loc_string)

        @x=num_form[0]
        @y=num_form[1]
        
        return @board[@x][@y]
    end
    def convert_to_grid_form(loc_string)
        x= loc_string[1].to_i
        y= loc_string[0]

        letters =['a','b','c','d','e','f','g','h']
        x=8-x
        y=letters.index(y)
        
        
        return [x,y]
         
    end
    def get_end(loc_string)
        num_form=convert_to_grid_form(loc_string)

        x=num_form[0]
        y=num_form[1]

        return [x,y]
    end
    def is_valid
        x=@end_point[0]
        y=@end_point[1]
        valid=false
        
        if @piece.is_move_allowed(x,y) && @piece.check_path(x,y,@board)
            valid=true
        end

        return valid
          
    end
    def to_s
        return "#{@piece.team} #{@piece.class} moved from #{input[0..1]} to #{input[2..3]}"
    end
    
end