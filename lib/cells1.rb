require './lib/XYCellLivingNeighborCounter.rb'

class Cells1 #TurnGridIntoListofCells
  attr_reader :cells

  def initialize(grid)
    @grid = grid
  end

  def play_gol(generations)
    cells = get_cell_attributes
    XYCellLivingNeighborCounter.new(cells).play_gol(generations)
  end

  def get_cell_attributes
    cells = []
    @grid.length.times do |x|
      @grid[x].length.times do |y|
        cells << { :position => position(x,y), :alive? => alive?(x,y) }
      end
    end
    cells
  end

  private

  def position(x,y)
    # { x: x, y: y }
    [x, y]
  end

  def alive?(x, y)
    @grid[x][y] == :living
  end
end