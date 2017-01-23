module Live
  class StateView
    # example state = [
    #   ['1', '1', '1', '0'],
    #   ['0', '0', '0', '1']
    # ]
    # Returns representation of state 
    # example response = ["*** ", "    "]
    #
    def render(state)
      state.map { |row| row.map { |col| col == "1" ? "*" : " " }.join }
    end
  end
end
