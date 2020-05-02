class Square
        attr_accessor :x,:y
    def initialize(x,y)
        @x,@y=x,y
    end

    def to_s
        x=8-@x
        letters =['a','b','c','d','e','f','g','h']
        y=letters[@y]
        return "#{y}#{x}"
    end
end