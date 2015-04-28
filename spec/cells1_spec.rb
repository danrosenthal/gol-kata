require 'cells1'

describe Cells1 do
  before(:each) do
    @grid = [[:living,:living,:dead],[:living,:living,:dead],[:living,:dead,:living]]
    @cells = Cells1.new(@grid)
  end

  context 'takes in a grid and returns a list of cells' do
    it 'has information about each cell\'s location'  do
      expect(@cells.get_cell_attributes[0][:position]).to eq([0,0])
    end
    it 'has information about each cell\'s state'  do
      expect(@cells.get_cell_attributes[0][:alive?]).to eq(true)
    end
  end


end