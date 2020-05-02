class Move
    attr_reader :piece, :start_square, :end_square

    
    
    def initialize(start_square,end_square,board,attack=false)
        @board=board
        @start_square=start_square
        @end_square=end_square
        @piece=get_piece

    end
    
    def get_piece
        return @board[start_square.x][start_square.y]
    end
    
    def is_valid
        x=@end_square.x
        y=@end_square.y

        if !(x.between?(0,7)&&y.between?(0,7))
            return false
        end
        
        if @piece !=nil
            
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