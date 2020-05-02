class Game_Piece
    # attr_accessor :x,:y
    # attr_reader :move_tree
    # def initialize(x,y)
    #     @x=x
    #     @y=y

    # end
    
    # def move(to_x,to_y)
    #     @x=to_x
    #     @y=to_y
        
    # end
end




class Rook < Game_Piece     
    attr_accessor :x,:y
    attr_reader :team
    def initialize(x,y,team=nil)
        @x=x
        @y=y
        @team=team
    end

    def is_move_allowed(to_x,to_y) #Checks to see if the move is allowed based on the pieces 'rule'
        allowed=false
        if @x==to_x || @y==to_y
            allowed=true
        end
        if @x==to_x && @y==to_y
            allowed=false
        end
       

        
        return allowed
    end

    def check_path(to_x,to_y,curr_board) #Checks to make sure if the path is clear for the requested move
        
        x_diff=to_x-@x
        y_diff=to_y-@y
        # puts "@x: #{@x} @y: #{@y} to_x: #{to_x} to_y: #{to_y}"
        x_dist = (x_diff).abs
        y_dist = (y_diff).abs
        
        path = []
        
        x_diff>0 ? x_dir=1:x_dir=-1
        y_diff>0 ? y_dir=1:y_dir=-1 

        for i in 0..x_dist
            for j in 0..y_dist
                #puts "@x+(i*x_dir): #{@x+(i*x_dir)} @y+(i*y_dir): #{@y+(i*y_dir)} "
                path.push(curr_board[@x+(i*x_dir)][@y+(j*y_dir)])
            end

        end

        
        # puts  "Path: #{path}" 
        path.shift
        path.pop
        # puts  "Path: #{path}" 
        
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

    def is_move_allowed(to_x,to_y) #Checks to see if the move is allowed based on the pieces 'rule'
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

    def check_path(to_x,to_y,curr_board)
        
        return true
        
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

    def is_move_allowed(to_x,to_y) #Checks to see if the move is allowed based on the pieces 'rule'
        allowed=false
        
        x_diff=to_x-@x
        y_diff=to_y-@y
        
        if x_diff.abs==y_diff.abs
            
            allowed=true
        end
        
        return allowed
    end
    def check_path(to_x,to_y,curr_board) #Checks to make sure if the path is clear for the requested move
        x_diff=to_x-@x
        y_diff=to_y-@y
        # puts "@x: #{@x} @y: #{@y} to_x: #{to_x} to_y: #{to_y}"
        dist = ((x_diff+y_diff)/2).abs
        
        path = []
        
        x_diff>0 ? x_dir=1:x_dir=-1
        y_diff>0 ? y_dir=1:y_dir=-1 

        for i in 0..dist
            
            #puts "@x+(i*x_dir): #{@x+(i*x_dir)} @y+(i*y_dir): #{@y+(i*y_dir)} "
            path.push(curr_board[@x+(i*x_dir)][@y+(i*y_dir)])

        end

        
        # puts  "Path: #{path}" 
        path.shift
        path.pop
        # puts  "Path: #{path}" 
        
        return path.all? {|s| s==" "}
        
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

    def is_move_allowed(to_x,to_y) #Checks to see if the move is allowed based on the pieces 'rule'
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
    def check_path(to_x,to_y,curr_board) #Checks to make sure if the path is clear for the requested move
        
        x_diff=to_x-@x
        y_diff=to_y-@y
        # puts "@x: #{@x} @y: #{@y} to_x: #{to_x} to_y: #{to_y}"
        x_dist = (x_diff).abs
        y_dist = (y_diff).abs
        
        path = []
        dist = ((x_diff+y_diff)/2).abs

        x_diff>0 ? x_dir=1:x_dir=-1
        y_diff>0 ? y_dir=1:y_dir=-1 
        
        if x_diff==0 || y_diff==0
            for i in 0..x_dist
                for j in 0..y_dist
                    # puts "@x+(i*x_dir): #{@x+(i*x_dir)} @y+(i*y_dir): #{@y+(i*y_dir)} "
                    path.push(curr_board[@x+(i*x_dir)][@y+(j*y_dir)])
                end

            end
        
        else
            for i in 0..dist
                
                #puts "@x+(i*x_dir): #{@x+(i*x_dir)} @y+(i*y_dir): #{@y+(i*y_dir)} "
                path.push(curr_board[@x+(i*x_dir)][@y+(i*y_dir)])

            end
        end

        
        #  puts  "Path: #{path}" 
        path.shift
        path.pop
        #  puts  "Path: #{path}" 
        
        return path.all? {|s| s==" "}
        
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
    # attr_reader :poss_moves
    def initialize(x,y,team=nil)
        @x=x
        @y=y
        @team=team
        # @poss_moves=find_moves
    end
    # def find_moves
    #     poss_moves=[]
        
    #     for i in -1..1
    #         for j -1..1
    #             x_new=@x+i
    #             y_new=@y+j
    #             if x_new >=0 && x_new<8 && y_new>=0 && y_new<8
    #                 if 
    #             poss_moves.push(@x+i,@y+j)
    # end

    def is_move_allowed(to_x,to_y) #Checks to see if the move is allowed based on the pieces 'rule'
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
    def check_path(to_x,to_y,curr_board)
        return true
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
    attr_accessor :x,:y, :first_move
    attr_reader :team
    
    def initialize(x,y,team=nil)
        @x=x
        @y=y
        @team=team
        @first_move=true
        
    end

    def is_move_allowed(to_x,to_y,attack=false) #Checks to see if the move is allowed based on the pieces 'rule'
        allowed=false
        
        x_diff=(to_x-@x).abs
        y_diff=(to_y-@y).abs
        
        if @first_move
            if x_diff==2 && y_diff==0
                allowed=true
            end
        end
        if attack
            if x_diff==1 && y_diff==1
                allowed= true
            end
        else
            if x_diff==1 && y_diff==0
                allowed=true
            end 

        end
        

        return allowed
    end
    def check_path(to_x,to_y,curr_board)
        if (to_y-@y).abs==1
            return true
        end
        if first_move
            x_diff=to_x-@x
            
            x_diff>0 ? x_dir=1:x_dir=-1
        
            path= curr_board[@x+x_dir][@y]

            return path == " "
        else
            return true
        end
    end
    def to_s
        if @team=='w'
            return "♙"
        else
            return "♟"
        end
    end
end
