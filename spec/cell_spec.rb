require 'cell'

describe Cell do
  grid = [[0,1,0],[0,0,0],[0,0,0]]

  context "a cell's state indicates its life" do
    it "returns dead when the state is 0" do
      cell = Cell.new(grid, 0, 0)
      expect(cell.define).to eq(:dead)
    end
    it "returns living when the state is 1" do
      cell = Cell.new(grid, 0, 1)
      expect(cell.define).to eq(:living)
    end
  end

  context "a living cell can die and a dead cell can live" do
    it "changes from dead to living" do
      cell = Cell.new(grid, 0, 0)
      cell.live!
      expect(cell.state).to eq(1)
    end
    it "changes from living to dead" do
      cell = Cell.new(grid, 0, 1)
      cell.die!
      expect(cell.state).to eq(0)
    end
  end

  context "a cell in a grid has neighbors" do
    cell = Cell.new(grid, 1, 1)
    
    it "returns an array of the northern neighbor coordinates for a cell" do
      expect(cell.find_northern_neighbor).to eq([0,1])
    end
    it "returns an array of the northernwestern neighbor coordinates for a cell" do
      expect(cell.find_northernwestern_neighbor).to eq([0,0])
    end
    it "returns an array of the western neighbor coordinates for a cell" do
      expect(cell.find_western_neighbor).to eq([1,0])
    end
    it "returns an array of the southwestern neighbor coordinates for a cell" do
      expect(cell.find_southwestern_neighbor).to eq([2,0])
    end
    it "returns an array of the southern neighbor coordinates for a cell" do
      expect(cell.find_southern_neighbor).to eq([2,1])
    end
    it "returns an array of the southeastern neighbor coordinates for a cell" do
      expect(cell.find_southeastern_neighbor).to eq([2,2])
    end
     it "returns an array of the eastern neighbor coordinates for a cell" do
      expect(cell.find_eastern_neighbor).to eq([1,2])
    end
    it "returns an array of the northeastern neighbor coordinates for a cell" do
      expect(cell.find_northeastern_neighbor).to eq([0,2])
    end
  end
end