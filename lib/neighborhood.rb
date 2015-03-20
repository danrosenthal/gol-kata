class Neighborhood
  attr_reader :grid, :x, :y
  def initialize(grid, x, y)
    @x = x
    @y = y
    @grid = grid
  end
  def number_of_living_neighbors
    neighbor_states = []
    get_neighbors.each do |x, y|
      neighbor_states << grid[x][y]
    end
    neighbor_states.reduce(:+)
  end

  def get_neighbors
    neighbors = [find_northern_neighbor, find_northernwestern_neighbor,
                 find_western_neighbor, find_southwestern_neighbor,
                 find_southern_neighbor, find_southeastern_neighbor,
                 find_eastern_neighbor, find_northeastern_neighbor].compact
  end

  def find_northern_neighbor
    [x-1, y] if (x-1 >= 0)
  end
  def find_northernwestern_neighbor
    [x-1, y-1] if (x-1 >= 0 && y-1 >=0)
  end
  def find_western_neighbor
    [x, y-1] if (y-1 >= 0)
  end
  def find_southwestern_neighbor
    [x+1, y-1] if (y-1 >= 0 && x+1 < grid.length)
  end
  def find_southern_neighbor
    [x+1, y] if (x+1 < grid.length)
  end
  def find_southeastern_neighbor
    [x+1, y+1] if (x+1 < grid.length && y+1 < grid.length)
  end
  def find_eastern_neighbor
    [x, y+1] if (y+1 < grid.length)
  end
  def find_northeastern_neighbor
    [x-1, y+1] if (x-1 >= 0 && y+1 < grid.length)
  end
end