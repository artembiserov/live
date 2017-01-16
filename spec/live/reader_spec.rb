require "./spec/spec_helper"

describe Live::Reader do
  describe ".perform" do
    let(:filename) { "./spec/fixtures/example.txt" }

    subject(:result) { described_class.perform(filename) }

    it "returns state as a result" do
      expect(result).to be_instance_of(Live::State)
    end

    it "transforms digits to boolean values" do
      expect(Live::State).to receive(:build_from_array).with([[1, 1, 1, 0], [0, 0, 0, 1]])

      described_class.perform(filename)
    end
  end
end
