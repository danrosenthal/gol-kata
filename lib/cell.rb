class Cell
  attr_reader :state, :x, :y, :grid, :living_neighbors
  def initialize(grid, x, y)
    @x = x
    @y = y
    @grid = grid
    @state = grid[x][y]
    get_number_of_living_neighbors
  end

  def define
    if living?
      :living
    elsif dead?
      :dead
    end
  end

  def living?
    @state == 1
  end
  def dead?
    @state == 0
  end

  def live!
    @state = 1
  end
  def die!
    @state = 0
  end

  def get_neighbors
    [find_northern_neighbor, find_northernwestern_neighbor, 
      find_western_neighbor, find_southwestern_neighbor, 
      find_southern_neighbor, find_southeastern_neighbor, 
      find_eastern_neighbor, find_northeastern_neighbor]
  end

  def get_number_of_living_neighbors
    neighbor_states = []
    get_neighbors.each do |x, y|
      neighbor_states << grid[x][y]
    end
    @living_neighbors = neighbor_states.reduce(:+)
  end

  def find_northern_neighbor
    [x-1, y]
  end
  def find_northernwestern_neighbor
    [x-1, y-1]
  end
  def find_western_neighbor
    [x, y-1]
  end
  def find_southwestern_neighbor
    [x+1, y-1]
  end
  def find_southern_neighbor
    [x+1, y]
  end
  def find_southeastern_neighbor
    [x+1, y+1]
  end
  def find_eastern_neighbor
    [x, y+1]
  end
  def find_northeastern_neighbor
    [x-1, y+1]
  end
end
