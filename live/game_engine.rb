module Live
  class GameEngine
    ALIVE = "1".freeze
    DEAD = "0".freeze
    ALLOWED_ALIVE_NEIGHBORS = [2, 3].freeze

    def generate_next_state(state)
      state.map.with_index do |line, i|
        line.map.with_index do |el, j|
          prev_line = i == 0 ? state.count - 1 : i - 1
          prev_column = j == 0 ? state.first.count - 1 : j - 1
          next_line = i == state.count - 1 ? 0 : i + 1
          next_column = j == state.first.count - 1 ? 0 : j + 1

          live_neighbors_count = [
            state[prev_line][prev_column], state[prev_line][j], state[prev_line][next_column], 
            state[i][prev_column], state[i][next_column], 
            state[next_line][prev_column], state[next_line][j], state[next_line][next_column], 
          ].count { |neighbor| neighbor == ALIVE }

          ALLOWED_ALIVE_NEIGHBORS.include?(live_neighbors_count) ? ALIVE : DEAD
        end
      end
    end
  end
end
