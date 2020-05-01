class Square
        attr_accessor :x,:y
    def initialize(x,y)
        @x,@y=x,y
    end

    def to_s
        return "x: #{x}, y: #{y}"
    end
end