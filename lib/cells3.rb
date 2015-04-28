require './lib/XYCellLivingNeighborCounter.rb'

class Cells3
  attr_reader :cells

  def initialize(cells)
    @cells = cells
  end

  def play_gol(generations)
    @generations = generations
    if @generations == 0 
      @cells
    else 
      XYCellLivingNeighborCounter.new(@cells).play_gol(@generations)
    end
  end
end