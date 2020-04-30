require_relative 'Pieces'
require_relative 'Move'




class Game_board
    attr_accessor :curr_board
    attr_reader   :disp_array
    def initialize(inc_board=nil)
        if inc_board==nil
            @curr_board=create_board  #Creates the Board
        else
            @curr_board=create_pieces(inc_board) #Creates Game piece objects for the board
        end
    end
    def create_board()
        board =[["Rb","Nb","Bb","Qb","Kb","Bb","Nb","Rb"],
                ["Pb","Pb","Pb","Pb","Pb","Pb","Pb","Pb"],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "," "],
                ["Pw","Pw","Pw","Pw","Pw","Pw","Pw","Pw"],
                ["Rw","Nw","Bw","Qw","Kw","Bw","Nw","Rw"]]
        return create_pieces(board)
        
    end
    def create_pieces(text_board)           #Goes through the board and turns the text version of the pieces into the proper disp unicode
        board=[]
        text_board.each_with_index do |p,r|
            row=[]
            p.each_with_index do |e,c|
                if e != " "
                    # board[r][c]=(create_piece(e,r,c))
                    row.push(create_piece(e,r,c))
                else
                    row.push(" ")
                end
            end
            board.push(row)
        end
        return board

        

    end
    def create_piece(e,r,c)    #Returns a new object for each of the game pieces
        piece_map={
            
                "Rb"=>Rook.new(r,c,'b'),
                "Nb"=>Knight.new(r,c,'b'),
                "Bb"=>Bishop.new(r,c,'b'),
                "Qb"=>Queen.new(r,c,'b'),
                "Kb"=>King.new(r,c,'b'),
                "Pb"=>Pawn.new(r,c,'b'),
                "Rw"=>Rook.new(r,c,'w'),
                "Nw"=>Knight.new(r,c,'w'),
                "Bw"=>Bishop.new(r,c,'w'),
                "Qw"=>Queen.new(r,c,'w'),
                "Kw"=>King.new(r,c,'w'),
                "Pw"=>Pawn.new(r,c,'w'),
        
        }

        return piece_map[e]
        
        
    end

    def make_move(move_input,board=@curr_board) #Creates a move and checks if move is valid for the given piece
        
        my_move=Move.new(move_input,board)
        valid_move=my_move.is_valid

        if valid_move
            move_piece(my_move)
        end
        
        return valid_move

        
    end
    def move_piece(my_move) #Updates the curr board display and replays the start point with ' '
        curr_piece=my_move.piece
        puts "@curr_piece: #{curr_piece} curr_piece class : #{curr_piece.class}"
        x_start= curr_piece.x
        y_start= curr_piece.y

        x_end=my_move.end_point[0]
        y_end=my_move.end_point[1]

        curr_piece.move(x_end,y_end)

        @curr_board[x_start][y_start]=" "
        @curr_board[x_end][y_end]=curr_piece
    end
    def display_board      #modifies the gameboard to a 'display-ready' format
        @disp_array=[["8"," "," "," "," "," "," "," "," "],
                    ["7"," "," "," "," "," "," "," "," "],
                    ["6"," "," "," "," "," "," "," "," "],
                    ["5"," "," "," "," "," "," "," "," "],
                    ["4"," "," "," "," "," "," "," "," "],
                    ["3"," "," "," "," "," "," "," "," "],
                    ["2"," "," "," "," "," "," "," "," "],
                    ["1"," "," "," "," "," "," "," "," "],
                    [" ","a","b","c","d","e","f","g","h"]]

        
        @curr_board.each_with_index do |row,r|
            row.each_with_index do |e,c|
                 
                disp_array[r][c+1]=e.to_s
                
            end
        end
    end
        
    def print_board     #Prints the board onto the command line!
        display_board
        @disp_array.each_with_index do |n,r|
            
            n.each do |c|
                print c+" │ "     #Uses grid lines to make it look nice
            end
            puts "\n────────────────────────────────────"
        end
    

    end
   

end



# my_bish=Bishop.new(4,4)
# my_bish.is_move_allowed(2,6)

# my_board=Game_board.new
# my_board.create_pieces

# my_board.print_board