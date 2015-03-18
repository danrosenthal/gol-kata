class Cell
  attr_reader :state, :x, :y, :grid, :number_of_living_neighbors
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
    neighbors = [find_northern_neighbor, find_northernwestern_neighbor, 
      find_western_neighbor, find_southwestern_neighbor, 
      find_southern_neighbor, find_southeastern_neighbor, 
      find_eastern_neighbor, find_northeastern_neighbor].compact
  end

  def get_number_of_living_neighbors
    neighbor_states = []
    get_neighbors.each do |x, y|
      if grid[x][y] != nil
        neighbor_states << grid[x][y]
      end
    end
    @number_of_living_neighbors = neighbor_states.reduce(:+)
  end

  def find_northern_neighbor
    if (x-1 >= 0)
      [x-1, y]
    end
  end
  def find_northernwestern_neighbor
    if (x-1 >= 0 && y-1 >=0)
      [x-1, y-1]
    end
  end
  def find_western_neighbor
    if (y-1 >= 0)
      [x, y-1]
    end
  end
  def find_southwestern_neighbor
    if (y-1 >= 0)
      [x+1, y-1]
    end
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
    if (x-1 >= 0)
      [x-1, y+1]
    end
  end
end
