require_relative '../Chess'

describe Game_board do
    before(:each) do
        @test_game=Game_board.new
    end

    describe "#create_board" do
        it "Creates an empty 8x8 board" do
            board =[["Rb","Nb","Bb","Qb","Kb","Bb","Nb","Rb"],
                    ["Pb","Pb","Pb","Pb","Pb","Pb","Pb","Pb"],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    ["Pw","Pw","Pw","Pw","Pw","Pw","Pw","Pw"],
                    ["Rw","Nw","Bw","Qw","Kw","Bw","Nw","Rw"]]
            @test_game.create_board
            expect(@test_game.curr_board).to eql board
        end
    end
    describe "#disp_board" do
        it "Turns the 'board' into a 'display board" do
            board =[["Rb","Nb","Bb","Qb","Kb","Bb","Nb","Rb"],
                    ["Pb","Pb","Pb","Pb","Pb","Pb","Pb","Pb"],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    ["Pw","Pw","Pw","Pw","Pw","Pw","Pw","Pw"],
                    ["Rw","Nw","Bw","Qw","Kw","Bw","Nw","Rw"]]

                    
            display =  [["8","♜","♞","♝","♛","♚","♝","♞","♜"],
                        ["7","♟","♟","♟","♟","♟","♟","♟","♟"],
                        ["6"," "," "," "," "," "," "," "," "],
                        ["5"," "," "," "," "," "," "," "," "],
                        ["4"," "," "," "," "," "," "," "," "],
                        ["3"," "," "," "," "," "," "," "," "],
                        ["2","♙","♙","♙","♙","♙","♙","♙","♙"],
                        ["1","♖","♘","♗","♕","♔","♗","♘","♖"],
                        [" ","a","b","c","d","e","f","g","h"]]
            @test_game.curr_board=board
            @test_game.display_board
            expect(@test_game.disp_array).to eql display
        end
    end
    

 
end

describe Game_Piece do
    before(:each) do
        @test_piece=Game_Piece.new(1,3)
    end

    describe "#move" do
        it "returns a new location for the given piece" do
            board =[["Rb","Nb","Bb","Qb","Kb","Bb","Nb","Rb"],
                    ["Pb","Pb","Pb","Pb","Pb","Pb","Pb","Pb"],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    ["Pw","Pw","Pw","Pw","Pw","Pw","Pw","Pw"],
                    ["Rw","Nw","Bw","Qw","Kw","Bw","Nw","Rw"]]
            
            @test_piece.move(4,5)
            expect(@test_piece.x).to eql 4
            expect(@test_piece.y).to eql 5

        end

    end
    

end
