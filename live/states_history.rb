class Live
  class StatesHistory
    def initialize
      @versions = []
    end

    def add(state)
      @versions << state
    end

    def include?(state)
      @versions.include?(state)
    end
  end
end
