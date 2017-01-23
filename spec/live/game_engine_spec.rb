require "./spec/spec_helper"
require "./live/game_engine"

describe Live::GameEngine do
  describe "#generate_next_state" do
    before do
      state = [%w(1 1 1 0), %w(0 0 0 1)]
      @result = described_class.new.generate_next_state(state)
    end

    it "generates state of next generation" do
      expect(@result).to eq([%w(1 1 1 0), %w(0 0 0 0)])
    end
  end
end
