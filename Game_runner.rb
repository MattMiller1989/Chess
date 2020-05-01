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

        white_move=get_move(turn)
        

            
        
        @my_board.move_piece(white_move)
        @my_board.print_board
        puts @move_list.last




    end
    def get_move(team)
            valid_move=false
            while ! valid_move
                puts "team #{team} please enter your first move: "
                move_in=gets.chomp
                # valid_move=white_in.match(/^([a-h][1-8]){2}$/)
                
                if move_in.match(/^([a-h][1-8]){2}$/) != nil
                    valid_in=true
                else
                    valid_in=false
                end
                
                puts "valid_in: #{valid_in}"
                if valid_in
                    
                    curr_move=@my_board.make_move(move_in)
                    puts "#{curr_move.is_valid} #{curr_move.piece.team}"
                    
                    if curr_move.is_valid && curr_move.piece.team == team[0]
                        puts "#{curr_move.is_valid} #{curr_move.piece.team}"
                        valid_move=true
                    end
                end
                puts "valid_move: #{valid_move}"
                @move_list.push(curr_move)

            end
            return curr_move
        
    end
end

my_game=Game_runner.new