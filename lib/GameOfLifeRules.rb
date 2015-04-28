require './lib/cells3.rb'

class GameOfLifeRules
  attr_reader :cells

  def initialize(cells)
    @cells = cells
  end

  def play_gol(generations)
    @generations = (generations += -1)
    set_next_cell_state!
    Cells3.new(@cells).play_gol(@generations)
  end

  def set_next_cell_state!
    @cells.each do |cell|
      @state = cell[:alive?]
      @living_neighbors = cell[:living_neighbors]

      if (underpopulated? && living?)
        cell[:alive?] = false
      elsif (overcrowded? && living?)
        cell[:alive?] = false
      elsif (hospitable? && living?)
        cell[:alive?] = true
      elsif (favorable? && dead?)
        cell[:alive?] = true
      else
        cell[:alive?] = false
      end

      remove_living_neighbor_count!(cell)

    end
    @cells
  end

  private

  def underpopulated?
   @living_neighbors < 2
  end
  def overcrowded?
    @living_neighbors > 3
  end
  def hospitable?
    @living_neighbors.between?(2,3)
  end
  def favorable?
    @living_neighbors == 3
  end

  def living?
    @state == true
  end
  def dead?
    @state == false
  end

  def remove_living_neighbor_count!(cell)
    cell.delete(:living_neighbors)
  end

end