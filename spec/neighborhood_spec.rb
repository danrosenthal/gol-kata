require 'neighborhood'

describe Neighborhood do
  grid = [[1,1,0],[1,1,0],[1,0,1]]
  context "a neighborhood in a grid has neighbors" do
    neighborhood = Neighborhood.new(grid, 1, 1)

    it "returns an array of the northern neighbor coordinates for a neighborhood" do
      expect(neighborhood.find_northern_neighbor).to eq([0,1])
    end
    it "returns an array of the northernwestern neighbor coordinates for a neighborhood" do
      expect(neighborhood.find_northernwestern_neighbor).to eq([0,0])
    end
    it "returns an array of the western neighbor coordinates for a neighborhood" do
      expect(neighborhood.find_western_neighbor).to eq([1,0])
    end
    it "returns an array of the southwestern neighbor coordinates for a neighborhood" do
      expect(neighborhood.find_southwestern_neighbor).to eq([2,0])
    end
    it "returns an array of the southern neighbor coordinates for a neighborhood" do
      expect(neighborhood.find_southern_neighbor).to eq([2,1])
    end
    it "returns an array of the southeastern neighbor coordinates for a neighborhood" do
      expect(neighborhood.find_southeastern_neighbor).to eq([2,2])
    end
    it "returns an array of the eastern neighbor coordinates for a neighborhood" do
      expect(neighborhood.find_eastern_neighbor).to eq([1,2])
    end
    it "returns an array of the northeastern neighbor coordinates for a neighborhood" do
      expect(neighborhood.find_northeastern_neighbor).to eq([0,2])
    end

    it "creates an array with all the neighbors" do
      expect(neighborhood.get_neighbors).to eq([[0,1],[0,0],[1,0],[2,0],[2,1],[2,2],[1,2],[0,2]])
    end
  end

  context "may have living neighbors" do
    neighborhood = Neighborhood.new(grid, 0, 1)

    it "has three living neighbors" do
      expect(neighborhood.number_of_living_neighbors).to eq(3)
    end
  end

  context "may not have neighbors to some directions" do
    neighborhood = Neighborhood.new(grid, 0, 0)

    it "has three living neighbors" do
      expect(neighborhood.number_of_living_neighbors).to eq(3)
    end
  end
end
