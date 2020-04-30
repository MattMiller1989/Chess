require_relative 'Pieces'
require_relative 'Move'
require_relative 'Chess'

class Game_runner

    def initialize
        @my_board=Game_board.new
        play_game       
    end
    def play_game
        @my_board.print_board
        puts "Let's Play Chess!!"
        puts "Please enter your first move: "
    end


end

my_game=Game_runner.new