class Move
    attr_reader :is_valid
    
    def initialize(piece,go_to)
        @piece=piece
        @go_to=go_to
        @is_valid=check_valid
    end

    def go
        check_path
    end
    def check_path
        if ! @piece.is_a Knight
            valid =true
        else

        end
            
    end

end