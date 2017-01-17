class Live
  class StatePresenter
    def self.render(state)
      new(state).render
    end

    def initialize(state)
      @state = state
    end

    def render
      puts @state
    end
  end
end
