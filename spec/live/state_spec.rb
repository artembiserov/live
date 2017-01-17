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

  describe "#predict_next_state" do
    let(:array) { 
      [
        [1, 1, 0],
        [1, 0, 0],
        [0, 1, 0]
      ]
    }
    subject(:state) { described_class.build_from_array(array) }

    before { state.predict_next_state }

    it "returns live neighbors count" do
      expect(state[1][1]).to eq({ live: false, live_neighbors: 4, live_in_feature: false })
      expect(state[0][0]).to eq({ live: true, live_neighbors: 3, live_in_feature: true })
    end
  end
end
