require './lib/GameOfLifeRules.rb'

class Cells2
  attr_reader :cells

  def initialize(cells)
    @cells = cells
  end

  def play_gol(generations)
    @generations = generations
    GameOfLifeRules.new(@cells).play_gol(@generations)
  end

end