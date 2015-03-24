require 'generator'

describe Generator do
  context "takes in a grid with one living cell" do
    grid = [[:dead,:dead,:dead, :dead],[:dead,:dead,:dead, :dead],[:dead,:dead,:living,:dead],[:dead,:dead,:dead,:dead]]
    generator = Generator.new(grid)
    it "kills the living cell" do
      generator.next_generation
	
      expected_grid = [[:dead,:dead,:dead, :dead],[:dead,:dead,:dead, :dead],[:dead,:dead,:dead,:dead],[:dead,:dead,:dead,:dead]]

      expect(generator.grid).to eq(expected_grid)
    end
  end
end
