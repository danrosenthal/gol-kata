require 'cell'

describe Cell do

  context "a cell's state indicates its life" do
    it "returns dead when the state is 0" do
      cell = Cell.new(:dead, 0)
      expect(cell.dead?).to eq(true)
    end
    it "returns living when the state is 1" do
      cell = Cell.new(:living, 0)
      expect(cell.living?).to eq(true)
    end
  end

  context "a living cell can die and a dead cell can live" do
    it "changes from dead to living" do
      cell = Cell.new(:dead, 0)
      cell.live!
      expect(cell.state).to eq(:living)
    end
    it "changes from living to dead" do
      cell = Cell.new(:living, 0)
      cell.die!
      expect(cell.state).to eq(:dead)
    end
  end

  context "has fewer than two living neighbors" do
    cell = Cell.new(:living, 1)
    it "is underpopulated" do
      expect(cell.underpopulated?).to eq(true)
    end
  end
  context "has more than three living neighbors" do
    cell = Cell.new(:living, 4)
    it "is overcrowded" do
      expect(cell.overcrowded?).to eq(true)
    end
  end

  context "has two or three living neighbors" do
    it "has two living neighbors and lives on" do
      cell = Cell.new(:living, 2)
      expect(cell.hospitable?).to eq(true)
    end
    it "has three living neighbors and lives on" do
      cell = Cell.new(:living, 3)
      expect(cell.hospitable?).to eq(true)
    end
  end

  context "has one living neighbor and is alive" do
    it "should die" do
      cell = Cell.new(:living, 1)
      expect(cell.next_state?).to eq(:dead)
    end
  end
end
