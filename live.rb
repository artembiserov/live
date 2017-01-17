require "./live/reader"
require "./live/state"
require "./live/state_presenter"
require "./live/states_history"

class Live
  def initialize
    @state = Reader.perform("./example.txt")
    @state.predict_next_state
    @history = StatesHistory.new
  end

  def run
    while !@history.include?(@state) && @state.has_live?
      StatePresenter.render(@state)
      @history.add(@state)
      @state = State.build_from_previous(@state)
    end

    StatePresenter.render(@state)
  end
end

Live.new.run
