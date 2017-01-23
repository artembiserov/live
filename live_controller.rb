require_relative "live/state_view"
require_relative "live/game_policy"
require_relative "live/game_engine"
require_relative "live/states_history"
require_relative "live/file_reader"

class LiveController
  def initialize
    @view = Live::StateView.new
    @policy = Live::GamePolicy.new
    @game_engine = Live::GameEngine.new
    @history = Live::StatesHistory.new
    @file_reader = Live::FileReader.new
  end

  def call(file_name)
    current_state = @file_reader.read_file(file_name)

    loop do
      @history.push(current_state)
      system "clear"
      puts @view.render(current_state)
      @policy.wait

      current_state = @game_engine.generate_next_state(current_state)
      break if @history.include?(current_state)
    end
  end
end

LiveController.new.call("./example.txt")
