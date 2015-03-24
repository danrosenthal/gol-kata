require './lib/cell.rb'
require './lib/neighborhood.rb'

class Generator
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def  next_generation
    neighborhood = Neighborhood.new(grid)
    grid.length.times do |x|
      grid[x].length.times do |y|
        cell = Cell.new(grid[x][y], neighborhood.number_of_living_neighbors(x,y))
        grid[x][y] = cell.next_state?
      end
    end
    grid
  end

  def future_generations(number_of_generations)
    number_of_generations.times do
      next_generation
    end
  end
end