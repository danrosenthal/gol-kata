require 'reader'

describe Reader do
  context 'opens a specified text file' do
    reader = Reader.new("./fixtures/generation1.txt")
    it 'saves generation1.txt to a grid variable' do
      expect(reader.get_file).to eq(":living :living :dead :dead\n:living :living :dead :dead\n:living :dead :living :dead\n:living :dead :living :dead")
    end
  end
end
