require_relative 'Pieces'
require_relative 'Move'
require_relative 'Chess'

class Game_runner

    def initialize
        @my_board=Game_board.new
        play_game       
    end
    def play_game
        turn='white'
        game_over=false
        @my_board.print_board
        puts "Let's Play Chess!!"

        # while !game_over
            
            valid_white_move=false
            while ! valid_white_move
                puts "team #{turn} please enter your first move: "
                white_in=gets.chomp
                # valid_move=white_in.match(/^([a-h][1-8]){2}$/)
                
                if white_in.match(/^([a-h][1-8]){2}$/) != nil
                    valid_move=true
                else
                    valid_move=false
                end
                
                puts "valid_move: #{valid_move}"
                if valid_move
                    white_move=@my_board.make_move(white_in)
                    
                    if white_move.is_valid && white_move.piece.team == 'white'
                        valid_white_move=true
                    end
                end

            end
            @my_board.print_board
            puts white_move.to_s




    end


end

my_game=Game_runner.new