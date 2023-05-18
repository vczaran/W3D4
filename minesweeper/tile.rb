

class Tile
    attr_accessor :bomb, :revealed
    def initialize(bomb)
        @bomb = bomb
        @revealed = false
    end
end