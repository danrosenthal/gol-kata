require 'cell'

describe Cell do
  context "a cell's state indicates its life" do
    it "returns dead when the state is 0" do
      cell = Cell.new(0)
      expect(cell.define).to eq(:dead)
    end
    it "returns alive when the state is 1" do
      cell = Cell.new(1)
      expect(cell.define).to eq(:living)
    end
  end
  context "a living cell can die and a dead cell can live" do
    it "changes from dead to living" do
      cell = Cell.new(0)
      cell.live!
      expect(cell.state).to eq(1)
    end
    it "changes from living to dead" do
      cell = Cell.new(1)
      cell.die!
      expect(cell.state).to eq(0)
    end
  end
end