require 'XYCellLivingNeighborCounter'
require 'cells1'

describe XYCellLivingNeighborCounter do
  before(:each) do
    @grid = [[:living,:living,:dead],[:living,:living,:dead],[:living,:dead,:living]]
    @cells = Cells1.new(@grid)
    @attrs = @cells.get_cell_attributes
    @counter = XYCellLivingNeighborCounter.new(@attrs)
  end

  context 'takes in cell attributes' do
    it 'adds number of living neighbors to the cell\s attributes'  do
      expect(@counter.add_living_neighbors_to_cell_attributes![0][:living_neighbors]).to eq(3)
    end
  end

end