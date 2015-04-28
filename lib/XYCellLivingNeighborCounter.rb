require './lib/Cells2.rb'

class XYCellLivingNeighborCounter
  attr_reader :cells

  def initialize(cells)
    @cells = cells
  end

  def play_gol(generations)
    @generations = generations
    add_living_neighbors_to_cell_attributes!
    Cells2.new(@cells).play_gol(@generations)
  end

  def add_living_neighbors_to_cell_attributes!
    @cells.each do |cell|
      number_of_living_neighbors = 0

      find_neighbors(cell[:position][0], cell[:position][1]).each do |neighbor|
         @cells.each do |cell|
          if cell[:position] == neighbor && cell[:alive?] == true
            number_of_living_neighbors += 1
          end 
         end
      end
      cell.merge!(:living_neighbors => number_of_living_neighbors)
    end
    @cells
  end

  private

  def find_neighbors(x,y)
    [find_northern_neighbor(x,y), find_northernwestern_neighbor(x,y), find_western_neighbor(x,y), find_southwestern_neighbor(x,y), find_southern_neighbor(x,y), find_southeastern_neighbor(x,y), find_eastern_neighbor(x,y), find_northeastern_neighbor(x,y)]
  end
  def find_northern_neighbor(x,y)
    [x-1, y]
  end
  def find_northernwestern_neighbor(x,y)
    [x-1, y-1]
  end
  def find_western_neighbor(x,y)
    [x, y-1]
  end
  def find_southwestern_neighbor(x,y)
    [x+1, y-1]
  end
  def find_southern_neighbor(x,y)
    [x+1, y]
  end
  def find_southeastern_neighbor(x,y)
    [x+1, y+1]
  end
  def find_eastern_neighbor(x,y)
    [x, y+1]
  end
  def find_northeastern_neighbor(x,y)
    [x-1, y+1]
  end
end