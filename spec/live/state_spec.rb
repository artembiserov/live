require "./spec/spec_helper"

describe Live::State do
  describe ".build_from_array" do
    let(:array) { [[1, 0]] }

    subject(:result) { described_class.build_from_array(array) }

    it "returns instance with filled live values" do
      expect(result[0][0]).to eq({ live: true })
      expect(result[0][1]).to eq({ live: false })
    end
  end
end
