require "./spec/spec_helper"
require "./live/file_reader"

describe Live::FileReader do
  describe "#read_file" do
    before do
      filename = "./spec/fixtures/example.txt"
      @data = described_class.new.read_file(filename)
    end

    it "returns state as a result" do
      expect(@data).to eq([%w(1 1 1 0), %w(0 0 0 1)])
    end
  end
end
