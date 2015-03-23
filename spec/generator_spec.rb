require 'generator'

describe Generator do
  context "takes in a grid with one living cell" do
    grid = [[:dead,:dead,:dead, :dead],[:dead,:dead,:dead, :dead],[:dead,:dead,:living,:dead],[:dead,:dead,:dead,:dead]]
    generator = Generator.new(grid)
    it "kills the living cell" do
      expect(generator.grid[2][2]).to eq(:dead) 
    end
  end
end
