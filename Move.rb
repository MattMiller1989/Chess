class Move
    attr_reader :piece, :start_square, :end_square

    
    # def initialize(input,board,attack=false)
    #     @board=board
    #     @input=input
    #     @piece = get_piece(input[0..1])
    #     #puts "@piece: #{@piece} class: #{@piece.class}"
    #     @end_point=get_end(input[2..3])
    #     @attack=attack

        
    # end
    def initialize(start_square,end_square,board,attack=false)
        @board=board
        @start_square=start_square
        @end_square=end_square
        @piece=get_piece

    end
    # def get_piece(loc_string)
    #     num_form=convert_to_grid_form(loc_string)

    #     @x=num_form[0]
    #     @y=num_form[1]
        
    #     return @board[@x][@y]
    # end
    # def convert_to_grid_form(loc_string)
    #     x= loc_string[1].to_i
    #     y= loc_string[0]

    #     letters =['a','b','c','d','e','f','g','h']
    #     x=8-x
    #     y=letters.index(y)
        
        
    #     return [x,y]
         
    # end
    def get_piece
        return @board[start_square.x][start_square.y]
    end
    # def get_end(loc_string)
    #     num_form=convert_to_grid_form(loc_string)

    #     x=num_form[0]
    #     y=num_form[1]

    #     return [x,y]
    # end

    # def is_valid
    #     if @piece !=nil
    #         x=@end_point[0]
    #         y=@end_point[1]
    #         valid=false
    #         attack=@attack
    #         if @piece.is_a? Pawn
    #             if @piece.is_move_allowed(x,y,attack)
    #                 valid =true
    #             end

    #         elsif @piece.is_move_allowed(x,y) && @piece.check_path(x,y,@board)
    #             valid=true
    #         end

    #         return valid
    #     else
    #         return false
    #     end
    # end
    def is_valid
        if @piece !=nil
            x=@end_square.x
            y=@end_square.y
            valid=false
            attack=@attack
            if @piece.is_a? Pawn
                if @piece.is_move_allowed(x,y,attack)
                    valid =true
                end

            elsif @piece.is_move_allowed(x,y) && @piece.check_path(x,y,@board)
                valid=true
            end

            return valid
        else
            return false
        end
    end
    def to_s
        if @piece.team =='w'
            color='white'
        else
            color='black'
        end
        return "#{color} #{@piece.class} moved from #{@start_square} to #{@end_square}"
    end
    
end