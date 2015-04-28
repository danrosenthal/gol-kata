require 'GameOfLifeRules'


describe GameOfLifeRules do
  before(:each) do
    @cells = [{position: [0,0], alive?: true, living_neighbors: 1}, {position: [0,1], alive?: true, living_neighbors: 4}, {position: [0,2], alive?: true, living_neighbors: 2}]
    @gol = GameOfLifeRules.new(@cells)
  end

  context 'should play out a full generation of game of life' do
    it 'kills the first cell' do
      expect(@gol.set_next_cell_state![0][:alive?]).to eq(false)
    end
    it 'kills the second cell' do
      expect(@gol.set_next_cell_state![1][:alive?]).to eq(false)
    end
    it 'lets the third cell live' do
      expect(@gol.set_next_cell_state![2][:alive?]).to eq(true)
    end
  end
end