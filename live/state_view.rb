module Live
  class StateView
    def render(state)
      state.map { |row| row.map { |col| col == "1" ? "*" : " " }.join }
    end
  end
end
