class Game_Piece
    attr_accessor :x,:y
    attr_reader :move_tree
    def initialize(x,y)
        @x=x
        @y=y

    end
    
    def move(to_x,to_y)
        @x=to_x
        @y=to_y
        
    end
end




class Rook < Game_Piece
    attr_accessor :x,:y
    attr_reader :team
    def initialize(x,y,team=nil)
        @x=x
        @y=y
        @team=team
    end

    def is_move_allowed(to_x,to_y)
        allowed=false
        if @x==to_x || @y==to_y
            allowed=true
        end
        if @x==to_x && @y==to_y
            allowed=false
        end
        # if allowed
        #     path_clear=check_path(to_x,to_y)
        # end

        
        return allowed
    end

    def check_path(to_x,to_y,curr_board)
        x_diff=to_x-@x
        y_diff=to_y-@y
        
        dist = (x_diff-y_diff).abs
        path = []
        for r in @x..to_x
            for c in @y..to_y
                puts "r: #{r} c: #{c} element: #{curr_board[r][c]}"
                path.push(curr_board[r][c])
            end
        end
        path.shift
        path.pop
        puts  "Path: #{path}" 
        
        return path.all? {|s| s==" "}
        
    end
        
    
    def to_s
        if @team=='w'
            return "♖"
        else
            return "♜"
        end
    end
    
end

class Knight <Game_Piece
    attr_accessor :x,:y
    attr_reader :team
    def initialize(x,y,team=nil)
        @x=x
        @y=y
        @team=team
        
    end

    def is_move_allowed(to_x,to_y)
        allowed=false
        
        if (to_x==x+2 || to_x == x-2) && (to_y==y+1 || to_y==y-1)
            allowed=true
        end
        if (to_x==x+1 || to_x==x-1) && (to_y==y+2 || to_y==y-2)
            allowed=true
        end
        
        return allowed
    end
    def to_s
        if @team=='w'
            return "♘"
        else
            return "♞"
        end
    end
    
end

class Bishop <Game_Piece
    attr_accessor :x,:y
    attr_reader :team
    def initialize(x,y,team=nil)
        @x=x
        @y=y
        @team=team
        
    end

    def is_move_allowed(to_x,to_y)
        allowed=false
        
        x_diff=to_x-@x
        y_diff=to_y-@y
        
        if x_diff.abs==y_diff.abs
            
            allowed=true
        end
        
        return allowed
    end
    def to_s
        if @team=='w'
            return "♗"
        else
            return "♝"
        end
    end
    
end

class Queen <Game_Piece
    attr_accessor :x,:y
    attr_reader :team
    def initialize(x,y,team=nil)
        @x=x
        @y=y
        @team=team
    end

    def is_move_allowed(to_x,to_y)
        allowed=false
        
        x_diff=to_x-@x
        y_diff=to_y-@y
        
        if x_diff.abs==y_diff.abs
            
            allowed=true
        end
        if @x==to_x || @y==to_y
            allowed=true
        end
        if @x==to_x && @y==to_y
            allowed=false
        end
        return allowed
    end
    def to_s
        if @team=='w'
            return "♕"
        else
            return "♛"
        end
    end
    
end

class King <Game_Piece
    attr_accessor :x,:y
    attr_reader :team
    def initialize(x,y,team=nil)
        @x=x
        @y=y
        @team=team
        
    end

    def is_move_allowed(to_x,to_y)
        allowed=false
        
        x_diff=(to_x-@x).abs
        y_diff=(to_y-@y).abs
        
        if x_diff <=1 && y_diff <=1
            allowed= true
        end
        if x==to_x && y==to_y
            allowed = false
        end

        return allowed
    end
    def to_s
        if @team=='w'
            return "♔"
        else
            return "♚"
        end
    end
    
end

class Pawn <Game_Piece
    attr_accessor :x,:y
    attr_reader :team
    def initialize(x,y,team=nil)
        @x=x
        @y=y
        @team=team
        
    end

    def is_move_allowed(to_x,to_y,attack=false,first_move=false)
        allowed=false
        
        x_diff=(to_x-@x).abs
        y_diff=(to_y-@y).abs
        
        if first_move
            if x_diff==2 && y_diff==0
                allowed=true
            end
        else
            if attack
                if x_diff==1 && y_diff==1
                    allowed= true
                end
            else
                if x_diff==1 && y_diff==0
                    allowed=true
                end 

            end
        end

        return allowed
    end
    def to_s
        if @team=='w'
            return "♙"
        else
            return "♟"
        end
    end
end
