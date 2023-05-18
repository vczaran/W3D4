class Board

    def initialize(num_bombs)
        @grid = Array.new(9) {Array.new(9) {Tile.new(false)}}
        num_bombs.times do 
            row = rand(0..8)
            col = rand(0..8)
            while @grid[row][col].bomb?
                row = rand(0..8)
                col = rand(0..8)
            end
            @grid[row][col].bomb? = false
        end
    end


end