require "./spec/spec_helper"
require "./live/state_view"

describe Live::StateView do
  describe "#render" do
    before do
      state = [%w(1 1 1 0), %w(0 0 0 1)]
      @result = described_class.new.render(state)
    end

    it "shows generation representation" do
      expect(@result).to eq(["*** ", "   *"])
    end
  end
end
