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
        
        check =false
        
        while !game_over

                #  if turn== 'white'
                #     curr_king=@my_board.white_king
                # else
                #     curr_king=@my_board.black_king
                # end

                curr_move=get_move(turn)

                # check=@my_board.in_check?(turn[0],curr_king.x,curr_king.y)

                # puts "check #{check}"
                # while check
                #     puts "You are in check!!"
                    
                # check=@my_board.in_check?(turn[0],curr_king.x,curr_king.y)
               
                
                
            
                
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
                puts "team #{team} please enter your move: "
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
            if !valid_move
                return false
            end
        end
       
        
        if curr_move.is_valid && curr_move.piece.team == team[0]
           
            valid_move=true
        end
        
        if move_into_check?(curr_move,team)
            valid_move=false
        end
         
        return valid_move
        
    end
    def move_into_check?(my_move,curr_team)
        curr_piece=my_move.piece
        if curr_piece.is_a? King 
            x_end=my_move.end_square.x
            y_end=my_move.end_square.y
            
            check = @my_board.in_check?(curr_team[0],x_end,y_end)
            
        else
            if curr_team== 'white'
                curr_king=@my_board.white_king
            else
                curr_king=@my_board.black_king
            end

                check=@my_board.in_check?(curr_team[0],curr_king.x,curr_king.y)
                
                
        end
        
        if check
            puts "You cannot move into check!!1!!"
        end

        return check

    end
end

my_game=Game_runner.new