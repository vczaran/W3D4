require_relative "tile"

class Board
attr_reader :grid
    def initialize(num_bombs)
        @grid = Array.new(9) {Array.new(9) {Tile.new(false)}}
        num_bombs.times do 
            row = rand(0..8)
            col = rand(0..8)
            while @grid[row][col].bomb
                row = rand(0..8)
                col = rand(0..8)
            end
            @grid[row][col].bomb = true
        end
        neighbors = Hash.new {|h,k| h[k] = []}
        (0..8).each do |i_1|
            (0..8).each do |j_1|
                pos = [i_1,j_1]
                (-1..1).each do |i_2|
                    (-1..1).each do |j_2|
                        range = (0..8)
                        row_n = i_1 + i_2
                        col_n = j_1 + j_2
                        pos_n = [row_n,col_n]
                        if !(i_1 == row_n && j_1 == col_n) && (range.include?(row_n) && range.include?(col_n))
                            neighbors[pos] << pos_n
                        end
                    end
                end
            end
        end
        @neighbors = neighbors
    end

    def reveal(pos)
        row, col = pos
        tile = grid[row][col]
        if tile.revealed
            raise "This tile is already revealed."
        else
            tile.revealed = true
        end
        if tile.bomb
            game_over
        end
    end
    def game_over
        
    end
end