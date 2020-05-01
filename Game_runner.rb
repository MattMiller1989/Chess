require_relative 'Pieces'
require_relative 'Move'
require_relative 'Chess'

class Game_runner

    def initialize
        @my_board=Game_board.new
        @move_list=[]
        play_game       
    end
    def play_game
        
        turn='white'
        game_over=false
        @my_board.print_board
        puts "Let's Play Chess!! Here are some examples of valid inputs: a2a4 a5a2 b4h2"

        while !game_over

            curr_move=get_move(turn)
                 
            @my_board.move_piece(curr_move)
            @my_board.print_board
            puts @move_list.last
            if turn== 'white'
                turn= 'black'
            else
                turn= 'white'
            end
        end




    end
    def get_move(team)
            valid_move=false
            while ! valid_move
                puts "team #{team} please enter your first move: "
                move_in=gets.chomp
                
                
                if move_in.match(/^([a-h][1-8]){2}$/) != nil
                    valid_in=true
                else
                    valid_in=false
                end
                 
                if valid_in
                    
                    curr_move=@my_board.make_move(move_in)
                    valid_move=check_move(curr_move,team)
                   
                end
               
                

            end
            @move_list.push(curr_move)
            return curr_move
        
    end
    def check_move(curr_move,team)
        valid_move =false
        if curr_move.piece==" "
            return false
        end
        if @my_board.is_capture(curr_move)
            valid_move=@my_board.can_capture(curr_move)
        end
       
        
        if curr_move.is_valid && curr_move.piece.team == team[0]
           
            valid_move=true
        end
        
         puts "is_capture: #{@my_board.is_capture(curr_move)} valid_move: #{valid_move}"
         return valid_move
        
    end
end

my_game=Game_runner.new