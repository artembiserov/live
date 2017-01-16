require "./live/reader"
require "./live/state"
require "./live/state_presenter"
require "./live/states_history"

class Live
  def initialize
    Reader.perform("./example.txt")
  end

  def run
  end
end
