

class Game_board
    attr_accessor :curr_board
    attr_reader   :disp_array
    def initialize
        @curr_board=create_board
       
        
    end
    def create_board
        board =[["Rb","Nb","Bb","Qb","Kb","Bb","Nb","Rb"],
                ["Pb","Pb","Pb","Pb","Pb","Pb","Pb","Pb"],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                ["Pw","Pw","Pw","Pw","Pw","Pw","Pw","Pw"],
                ["Rw","Nw","Bw","Qw","Kw","Bw","Nw","Rw"]]
                return board
    end
    def display_board
        @disp_array=[["8","♜","♞","♝","♛","♚","♝","♞","♜"],
                    ["7","♟","♟","♟","♟","♟","♟","♟","♟"],
                    ["6"," "," "," "," "," "," "," "," "],
                    ["5"," "," "," "," "," "," "," "," "],
                    ["4"," "," "," "," "," "," "," "," "],
                    ["3"," "," "," "," "," "," "," "," "],
                    ["2","♙","♙","♙","♙","♙","♙","♙","♙"],
                    ["1","♖","♘","♗","♕","♔","♗","♘","♖"],
                    [" ","a","b","c","d","e","f","g","h"]]

        @curr_board.each_with_index do |row,r|
            row.each_with_index do |e,c|
                if e.match(/^[RNBQKP][bw]$/)
                    disp_array[r][c+1]=replace_square(e)
                end
            end
        end
    end
        
    def print_board
        display_board
        @disp_array.each_with_index do |n,r|
            
            n.each do |c|
                print c+" │ "
            end
            puts "\n────────────────────────────────────"
        end
    

    end
    def replace_square(s)
        disp_map={
                "Rb"=>"♜",
                "Nb"=>"♞",
                "Bb"=>"♝",
                "Qb"=>"♛",
                "Kb"=>"♚",
                "Pb"=>"♟",
                "Rw"=>"♖",
                "Nw"=>"♘",
                "Bw"=>"♗",
                "Qw"=>"♕",
                "Kw"=>"♔",
                "Pw"=>"♙",
        }

        return disp_map[s]
    end


end
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
    def initialize(x,y)
        @x=x
        @y=y
        
    end

    def is_move_allowed(to_x,to_y)
        allowed=false
        if @x==to_x || @y==to_y
            allowed=true
        end
        if @x==to_x && @y==to_y
            allowed=false
        end
        
        return allowed
    end
    
end

class Knight <Game_Piece
    attr_accessor :x,:y
    def initialize(x,y)
        @x=x
        @y=y
        
    end

    def is_move_allowed(to_x,to_y)
        allowed=false
        
        
        return allowed
    end
    
end




# my_board=Game_board.new

#
# rook_boi=Rook.new(3,4)

# puts "x: #{rook_boi.x} y: #{rook_boi.y}"
