require 'cell.rb'

class Neighborhood
  attr_reader :grid, :x, :y, :live_state
  def initialize(grid)
    @grid = grid
    @live_state = Cell.new.live_state
  end

  def number_of_living_neighbors(x,y)
    get_neighbors(x,y).map { |x, y| grid[x][y] } .count(live_state)
  end

  def get_neighbors(x,y)
    neighbors = [find_northern_neighbor(x,y), find_northernwestern_neighbor(x,y),
                 find_western_neighbor(x,y), find_southwestern_neighbor(x,y),
                 find_southern_neighbor(x,y), find_southeastern_neighbor(x,y),
                 find_eastern_neighbor(x,y), find_northeastern_neighbor(x,y)].compact
  end

  def find_northern_neighbor(x,y)
    [x-1, y] if (x-1 >= 0)
  end
  def find_northernwestern_neighbor(x,y)
    [x-1, y-1] if (x-1 >= 0 && y-1 >=0)
  end
  def find_western_neighbor(x,y)
    [x, y-1] if (y-1 >= 0)
  end
  def find_southwestern_neighbor(x,y)
    [x+1, y-1] if (y-1 >= 0 && x+1 < grid.length)
  end
  def find_southern_neighbor(x,y)
    [x+1, y] if (x+1 < grid.length)
  end
  def find_southeastern_neighbor(x,y)
    [x+1, y+1] if (x+1 < grid.length && y+1 < grid.length)
  end
  def find_eastern_neighbor(x,y)
    [x, y+1] if (y+1 < grid.length)
  end
  def find_northeastern_neighbor(x,y)
    [x-1, y+1] if (x-1 >= 0 && y+1 < grid.length)
  end
end