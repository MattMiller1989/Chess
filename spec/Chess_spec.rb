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

describe Rook do
    before(:each) do
        @test_rook=Rook.new(1,3)
    end
    describe "#is_move_allowed" do
        it "Allows horizontal moves" do

            expect(@test_rook.is_move_allowed(1,7)).to eql true
        end
        it "Allows vertical moves" do

            expect(@test_rook.is_move_allowed(4,3)).to eql true
        end
        it "Does not allow diagonal moves" do

            expect(@test_rook.is_move_allowed(3,5)).to eql false
        end
        it "Does not allow stupid moves" do

            expect(@test_rook.is_move_allowed(4,5)).to eql false
        end
    end
end

describe Knight do
    before(:each) do
        @test_knight=Knight.new(4,4)
    end
    describe "#is_move_allowed" do
        it "Allows +2 +1" do

            expect(@test_knight.is_move_allowed(6,5)).to eql true
        end
        it "Allows +2 -1" do

            expect(@test_knight.is_move_allowed(6,3)).to eql true
        end
        it "Allows -2 +1" do

            expect(@test_knight.is_move_allowed(2,5)).to eql true
        end
        it "Allows -2 -1" do

            expect(@test_knight.is_move_allowed(2,3)).to eql true
        end
        it "Allows +1 +2" do

            expect(@test_knight.is_move_allowed(5,6)).to eql true
        end
        it "Allows +1 -2" do

            expect(@test_knight.is_move_allowed(5,2)).to eql true
        end
        it "Allows -1 +2" do

            expect(@test_knight.is_move_allowed(3,6)).to eql true
        end
        it "Allows -1 -2" do

            expect(@test_knight.is_move_allowed(3,2)).to eql true
        end
        it "Does not -1 +1" do

            expect(@test_knight.is_move_allowed(3,5)).to eql false
        end
        it "Does not allow 0 +1" do

            expect(@test_knight.is_move_allowed(4,5)).to eql false
        end
    end
end

describe Bishop do
    before(:each) do
        @test_bish=Bishop.new(4,4)
    end
    describe "#is_move_allowed" do
        it "Allows +2 +2" do

            expect(@test_bish.is_move_allowed(6,6)).to eql true
        end
        it "Allows +3 +3" do

            expect(@test_bish.is_move_allowed(7,7)).to eql true
        end
        it "Allows -2 -2" do

            expect(@test_bish.is_move_allowed(2,2)).to eql true
        end
        it "Allows -1 -1" do

            expect(@test_bish.is_move_allowed(3,3)).to eql true
        end
        it "Allows +3 -3" do

            expect(@test_bish.is_move_allowed(7,1)).to eql true
        end
        it "Allows +1 -1" do

            expect(@test_bish.is_move_allowed(5,3)).to eql true
        end
        it "Allows -1 +2" do

            expect(@test_bish.is_move_allowed(3,6)).to eql false
        end
        it "Allows -1 -2" do

            expect(@test_bish.is_move_allowed(3,2)).to eql false
        end
        it "Allows -1 +1" do

            expect(@test_bish.is_move_allowed(3,5)).to eql true
        end
        it "Does not allow 0 +1" do

            expect(@test_bish.is_move_allowed(4,5)).to eql false
        end
    end
end

describe Queen do
    before(:each) do
        @test_queen=Queen.new(4,4)
    end
    describe "#is_move_allowed" do
        it "Allows +2 +2" do

            expect(@test_queen.is_move_allowed(6,6)).to eql true
        end
        it "Allows +3 +3" do

            expect(@test_queen.is_move_allowed(7,7)).to eql true
        end
        it "Allows -2 -2" do

            expect(@test_queen.is_move_allowed(2,2)).to eql true
        end
        it "Allows -1 -1" do

            expect(@test_queen.is_move_allowed(3,3)).to eql true
        end
        it "Allows +3 -3" do

            expect(@test_queen.is_move_allowed(7,1)).to eql true
        end
        it "Allows +1 -1" do

            expect(@test_queen.is_move_allowed(5,3)).to eql true
        end
        it "Allows -1 +2" do

            expect(@test_queen.is_move_allowed(3,6)).to eql false
        end
        it "Allows -1 -2" do

            expect(@test_queen.is_move_allowed(3,2)).to eql false
        end
        it "Allows -1 +1" do

            expect(@test_queen.is_move_allowed(3,5)).to eql true
        end
        it "Does not allow 0 +1" do

            expect(@test_queen.is_move_allowed(4,5)).to eql true
        end
        it "Allows horizontal moves" do

            expect(@test_queen.is_move_allowed(1,7)).to eql true
        end
        it "Allows vertical moves" do

            expect(@test_queen.is_move_allowed(4,3)).to eql true
        end
    end
end

describe King do
    before(:each) do
        @test_king=King.new(4,4)
    end
    describe "#is_move_allowed" do
        it "Allows +1 +1" do

            expect(@test_king.is_move_allowed(5,5)).to eql true
        end
        it "Allows +1 +0" do

            expect(@test_king.is_move_allowed(5,4)).to eql true
        end
        it "Allows -1 -1" do

            expect(@test_king.is_move_allowed(3,3)).to eql true
        end
        it "Allows -1 +1" do

            expect(@test_king.is_move_allowed(3,5)).to eql true
        end
        it "Allows +0 -1" do

            expect(@test_king.is_move_allowed(4,3)).to eql true
        end
        it "Allows +0 +1" do

            expect(@test_king.is_move_allowed(4,5)).to eql true
        end
        it "Does not Allows +2 +2" do

            expect(@test_king.is_move_allowed(6,6)).to eql false
        end
        it "Does not Allows +0 +3" do

            expect(@test_king.is_move_allowed(4,7)).to eql false
        end
        it "Does not Allows +0 +0" do

            expect(@test_king.is_move_allowed(4,4)).to eql false
        end
        it "Does not Allows -1 +3" do

            expect(@test_king.is_move_allowed(3,7)).to eql false
        end

    end
end

            




