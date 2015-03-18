class Cell
  attr_reader :state, :x, :y
  def initialize(grid, x, y)
    @x = x
    @y = y
    @state = grid[x][y]
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
end
