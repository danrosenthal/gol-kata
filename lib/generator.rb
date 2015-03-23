require './lib/cell.rb'
require './lib/neighborhood.rb'

class Generator
  
  def initialize(grid)
    @grid = grid
    next_generation
  end

  def  next_generation
    neighborhood = Neighborhood.new(grid)
    grid.length.times do |x|

      grid[x].length.times do |y|
        number_of_living_neighbors = neighborhood.number_of_living_neighbors(x,y)
        cell = Cell.new(grid[x][y], number_of_living_neighbors).
        print "[#{x},#{y}] — #{number_of_living_neighbors} —"
      end
    end
  end
end