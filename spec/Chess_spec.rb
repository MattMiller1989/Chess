require_relative '../Chess'
require_relative '../Pieces'
require_relative '../Game_runner'

describe Move do
    describe "#is_valid" do
        before(:each) do
            # @my_game=Game_board.new
            @board =[[" ","Nb","Bb","Qb","Kb","Bb","Nb","Rb"],
                    [" ","Pb"," ","Pb","Pb","Pb","Pb","Pb"],
                    [" "," "," "," ","Pb"," "," "," "],
                    [" ","Rb"," "," ","Pw"," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    ["Pw","Pw","Pw","Pw","Pw","Pw","Pw","Pw"],
                    ["Rw","Nw","Bw","Qw","Kw","Bw","Nw","Rw"]]
            @my_game=Game_board.new(@board)
        end
        it "allows a rook to move two spaces" do
            test_game=Game_board.new
            # test_move=Move.new("b5d5",@my_game.curr_board)
            test_move=test_game.make_move("b5d5",@my_game.curr_board)
            expect(test_move.is_valid).to eql true
        end
        it "does not allow move if path is blocked" do
            test_game=Game_board.new
            # test_move=Move.new("b5h5",@my_game.curr_board)
            test_move=test_game.make_move("b5h5",@my_game.curr_board)
            expect(test_move.is_valid).to eql false
        end
        it "Allows Queen move" do
            test_game=Game_board.new
            # test_move=Move.new("d8b6",@my_game.curr_board)
            test_move=test_game.make_move("d8b6",@my_game.curr_board)
            expect(test_move.is_valid).to eql true
        end
        it "Returns false when Queen move is invalid" do
            test_game=Game_board.new
            # test_move=Move.new("d8a6",@my_game.curr_board)
            test_move=test_game.make_move("d8a6",@my_game.curr_board)
            expect(test_move.is_valid).to eql false
        end
        it "Allows double move on first move for pawn" do
            test_game=Game_board.new
            # test_move=Move.new("h7h5",@my_game.curr_board)
            test_move=test_game.make_move("h7h5",@my_game.curr_board)
            expect(test_move.is_valid).to eql true
        end
        # it "Checks path for double pawn move" do
        #     test_move=Move.new("e7e5",@my_game.curr_board)
        #     expect(test_move.is_valid).to eql false
        # end
        

    end

end

describe Game_board do
    before(:each) do
        @test_game=Game_board.new
    end
    describe "#move_piece" do
        before(:each) do
            @my_game=Game_board.new
            @board =[["Rb","Nb","Bb","Qb","Kb","Bb","Nb","Rb"],
                    ["Pb","Pb","Pb","Pb","Pb","Pb","Pb","Pb"],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    ["Pw","Pw","Pw","Pw","Pw","Pw","Pw","Pw"],
                    ["Rw","Nw","Bw","Qw","Kw","Bw","Nw","Rw"]]
            @my_game=Game_board.new(@board)
           
        end
        it "allows a rook to move two spaces" do
            board= [["8","♜"," ","♝","♛","♚","♝","♞","♜"],
                    ["7","♟","♟","♟","♟","♟","♟","♟","♟"],
                    ["6","♞"," "," "," "," "," "," "," "],
                    ["5"," "," "," "," "," "," "," "," "],
                    ["4"," "," "," "," "," "," "," "," "],
                    ["3"," "," "," "," "," "," "," "," "],
                    ["2","♙","♙","♙","♙","♙","♙","♙","♙"],
                    ["1","♖","♘","♗","♕","♔","♗","♘","♖"],
                    [" ","a","b","c","d","e","f","g","h"]]
            # test_move=Move.new("b8a6",@my_game.curr_board)
            test_move=@my_game.make_move("b8a6",@my_game.curr_board)
            @my_game.move_piece(test_move)
            @my_game.display_board
            expect(@my_game.disp_array).to eql board
        end
        
        it "Allows Queen move" do
            # test_move=Move.new("d8b6",@my_game.curr_board)
            test_move=@my_game.make_move("d8b6",@my_game.curr_board)
            expect(test_move.is_valid).to eql true
        end
        it "Returns false when Queen move is invalid" do
            # test_move=Move.new("d8a6",@my_game.curr_board)
            test_move=@my_game.make_move("d8a6",@my_game.curr_board)
            expect(test_move.is_valid).to eql false
        end
        it "Allows double move on first move for pawn" do
            # test_move=Move.new("h7h5",@my_game.curr_board)
            test_move=@my_game.make_move("h7h5",@my_game.curr_board)
            expect(test_move.is_valid).to eql true
        end
        # it "Checks path for double pawn move" do
        #     test_move=Move.new("e7e5",@my_game.curr_board)
        #     expect(test_move.is_valid).to eql false
        # end
        

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
            # @test_game.curr_board=board
            @test_game.display_board
            expect(@test_game.disp_array).to eql display
        end
    end
    
    
   
    describe "#in_check?" do
        
        it "returns true if a pawn is in attack pos" do
            test_board=[["Rb","Nb","Bb","Qb","Kb","Bb","Nb","Rb"],
                        ["Pb","Pb","Pb","Pb"," ","Pb","Pb","Pb"],
                        [" "," "," "," "," "," "," "," "],
                        [" "," "," "," "," ","Pb"," "," "],
                        [" "," "," "," ","Kw"," "," "," "],
                        [" "," "," "," "," "," "," "," "],
                        ["Pw","Pw","Pw","Pw","Pw","Pw","Pw","Pw"],
                        ["Rw","Nw","Bw","Qw"," ","Bw","Nw","Rw"]]
            curr_game=Game_board.new(test_board)         
            curr_game.white_king=curr_game.curr_board[4][4]
            # puts " "
            # curr_game.print_board
            expect(curr_game.in_check?('w',4,4)).to eql true
        end
        it "returns true if a bishop is in attack pos" do
            test_board=[[" ","Nb","Bb","Qb","Kb","Bb","Nb","Rb"],
                        ["Pb","Pb","Pb","Pb"," ","Pb","Pb","Pb"],
                        ["Rb"," "," "," "," "," "," "," "],
                        [" "," "," "," "," ","Pb"," "," "],
                        [" ","Kw"," "," "," "," "," "," "],
                        [" "," "," "," "," "," "," "," "],
                        ["Pw","Pw","Pw","Pw","Pw","Pw","Pw","Pw"],
                        ["Rw","Nw","Bw","Qw"," ","Bw","Nw","Rw"]]
            curr_game=Game_board.new(test_board)         
            curr_game.white_king=curr_game.curr_board[4][1]
            # puts " "
            # curr_game.print_board
            expect(curr_game.in_check?('w',4,1)).to eql true
        end
        it "returns true if a knight is in attack pos" do
            test_board=[[" "," ","Bb","Qb","Kb","Bb","Nb","Rb"],
                        ["Pb","Pb","Pb","Pb"," ","Pb","Pb","Pb"],
                        ["Rb"," ","Nb"," "," "," "," "," "],
                        [" "," "," "," "," ","Pb"," "," "],
                        [" "," "," ","Kw"," "," "," "," "],
                        [" "," "," "," "," "," "," "," "],
                        ["Pw","Pw","Pw","Pw","Pw","Pw","Pw","Pw"],
                        ["Rw","Nw","Bw","Qw"," ","Bw","Nw","Rw"]]
            curr_game=Game_board.new(test_board)         
            curr_game.white_king=curr_game.curr_board[4][3]
            # puts " "
            # curr_game.print_board
            expect(curr_game.in_check?('w',4,3)).to eql true
        end
    end

    describe "#check_mate?" do

        it "returns true if a pawn is in attack pos" do
            test_board=[[" ","Nb","Bb","Qb","Kb","Bb","Nb"," "],
                        ["Pb","Pb","Pb","Pb"," ","Pb","Pb","Pb"],
                        ["Rb"," "," ","Kw"," "," "," "," "],
                        [" "," "," ","Pb"," "," ","Rb"," "],
                        [" "," "," "," "," "," "," "," "],
                        [" "," "," "," "," "," "," "," "],
                        ["Pw","Pw","Pw","Pw","Pw","Pw","Pw","Pw"],
                        ["Rw","Nw","Bw","Qw"," ","Bw","Nw","Rw"]]
        curr_game=Game_board.new(test_board)         
        curr_game.white_king=curr_game.curr_board[2][3]
        # puts " "
        # curr_game.print_board
        expect(curr_game.check_mate?('w',2,3)).to eql true

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
    describe "#check_path" do
        it "returns false if path is blocked" do
            board=  [[" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," ","♝"," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "]]
            
            expect(@test_rook.check_path(5,3,board)).to eql false
        end
        it "returns true if path is clear" do
            board=  [[" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," ","♝"," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "]]
            
            expect(@test_rook.check_path(2,3,board)).to eql true
        end
        it "returns true if path is clear horizontally one spot" do
            board=  [[" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," ","♝","♝"," "," "," "],
                    [" "," ","♝"," ","♝"," "," "," "],
                    [" "," "," "," ","♝"," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "]]
            
            @rook_boi=Rook.new(4,2)
            expect(@rook_boi.check_path(4,3,board)).to eql true
        end
        it "returns false if path is full horizontally three spot" do
            board=  [[" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," ","♝","♝"," "," "," "],
                    [" "," ","♝"," ","♝"," "," "," "],
                    [" "," "," "," ","♝"," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "]]
            
            @rook_boi=Rook.new(4,2)
            expect(@rook_boi.check_path(4,5,board)).to eql false
        end
        it "returns true if path is clear horizontally four spot" do
            board=  [[" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," ","♝","♝"," "," "," "],
                    [" "," ","♝"," ","♝"," "," "," "],
                    [" "," "," "," ","♝"," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "]]
            
            @rook_boi=Rook.new(6,2)
            expect(@rook_boi.check_path(6,6,board)).to eql true
        end
        it "returns false if verical path is full" do
            board=  [[" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," ","♝","♝"," "," "," "],
                    [" "," ","♝"," ","♝"," "," "," "],
                    [" "," "," "," ","♝"," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "]]
            
            @rook_boi=Rook.new(0,3)
            expect(@rook_boi.check_path(6,3,board)).to eql false
        end
        it "returns true if left path is empty" do
            board=  [[" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," ","♝","♝"," "," "," "],
                    [" "," ","♝"," ","♝"," "," "," "],
                    [" "," "," "," ","♝"," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "]]
            
            @rook_boi=Rook.new(6,6)
            expect(@rook_boi.check_path(0,6,board)).to eql true
        end
        it "returns false if left path is obstructed" do
            board=  [[" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," ","♝","♝"," "," "," "],
                    [" "," ","♝"," ","♝"," "," "," "],
                    [" "," "," "," ","♝"," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "]]
            
            @rook_boi=Rook.new(5,6)
            expect(@rook_boi.check_path(5,2,board)).to eql false
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
            @board=  [[" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," ","♝"," "," "],
                    [" "," "," ","♝","♝"," "," "," "],
                    [" "," ","♝"," "," "," ","♝"," "],
                    [" "," "," "," ","♝"," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "]]
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
    describe "#check_path" do
        before(:each) do
            board=  [[" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," ","♝"," "," "],
                    [" "," "," ","♝","♝"," "," "," "],
                    [" "," ","♝"," "," "," ","♝"," "],
                    [" "," "," "," ","♝"," "," "," "],
                    [" "," "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "," "]]

        end
        it "#returns true if the path is clear" do
            expect(@test_bish.check_path(5,5,@board)).to eql true

        end
        it "#returns false if the path is obstructed" do
            expect(@test_bish.check_path(2,2,@board)).to eql false

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
    describe "#check_path" do
        before(:each) do
            @board=  [[" "," "," "," "," "," "," "," "],
                    [" "," ","♝"," ","♝"," "," "," "],
                    [" "," ","♝"," "," ","♝","♝"," "],
                    [" "," "," ","♝"," "," "," "," "],
                    ["♝"," "," "," ","Q"," "," "," "],
                    [" "," "," "," "," "," ","♝"," "],
                    [" "," ","♝"," ","♝"," "," "," "],
                    [" "," "," "," "," "," "," "," "]]

        end
        it "#returns true if the path is clear" do
            expect(@test_queen.check_path(5,5,@board)).to eql true

        end
        it "#returns false if the path is obstructed" do
            expect(@test_queen.check_path(2,2,@board)).to eql false

        end
        it "#returns true if path is clear for right horizontal movements" do
            expect(@test_queen.check_path(4,6,@board)).to eql true

        end
        it "#returns true if path is clear for left horizontal movements" do
            expect(@test_queen.check_path(4,1,@board)).to eql true

        end
        it "#returns true if path is clear for right diagonal movements" do
            expect(@test_queen.check_path(6,6,@board)).to eql true

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
describe Pawn do
    before(:each) do
        @test_pawn=Pawn.new(4,4)
    end
    describe "#is_move_allowed" do
        it "Allows +1 +0" do

            expect(@test_pawn.is_move_allowed(5,4)).to eql true
        end
        it "Allows -1 +0" do

            expect(@test_pawn.is_move_allowed(3,4)).to eql true
        end
        it "Allows -1 -1 on Attack" do

            expect(@test_pawn.is_move_allowed(3,3,true)).to eql true
        end
        it "Allows -1 +1 on Attack" do

            expect(@test_pawn.is_move_allowed(3,5,true)).to eql true
        end
        it "Does not Allows +0 -1 on attack" do

            expect(@test_pawn.is_move_allowed(4,3,true)).to eql false
        end
        it "Does not Allows +1 +0" do

            expect(@test_pawn.is_move_allowed(5,4,true)).to eql false
        end
        it "Does not Allows +2 +2" do

            expect(@test_pawn.is_move_allowed(6,6)).to eql false
        end
        it "Does not Allows +0 +3" do

            expect(@test_pawn.is_move_allowed(4,7)).to eql false
        end
        it "Does not Allows +0 +0" do

            expect(@test_pawn.is_move_allowed(4,4)).to eql false
        end
        it "Does not Allows -1 +3" do

            expect(@test_pawn.is_move_allowed(3,7)).to eql false
        end
        it "Allows +2 +0 on first move" do
            @test_pawn.first_move=true
            expect(@test_pawn.is_move_allowed(6,4,false)).to eql true
        end
        it "Allows -2 +0 on first move" do
            @test_pawn.first_move=true
            expect(@test_pawn.is_move_allowed(2,4,false)).to eql true
        end
        it "Does not Allows -2 +1 on first move" do
            @test_pawn.first_move=true
            expect(@test_pawn.is_move_allowed(2,5,false)).to eql false
        end

    end
end

            




