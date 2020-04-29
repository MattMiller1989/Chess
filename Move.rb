class Move
    attr_reader :is_valid, :x, :y

    
    def initialize(piece,go_to,board)
        @piece=piece
        @go_to=go_to
        @is_valid=check_valid
        @board=board
    end

    def go
        check_path
    end
    def check_path
       
    end

end