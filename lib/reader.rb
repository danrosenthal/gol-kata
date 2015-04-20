class Reader
  attr_reader :path
  def initialize(path)
    @path = path
  end
  def get_file
    file = File.open(path, "r")
    grid = file.read
  end
end