class Live
  class StatePresenter
    def self.render(state)
      new(state).render
    end

    def initialize(state)
      @state = state
    end

    def render
      sleep 1
      system "clear"

      rendered_array = @state.map_to_array { |el| el[:live] ? "*" : " " }
      rendered_array.map! { |line| line.join }
      puts rendered_array
    end
  end
end
