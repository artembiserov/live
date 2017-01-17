class Live
  class State
    include Enumerable

    attr_accessor :array

    def self.build_from_array(array)
      new.tap do |state|
        state.array = array.map do |line|
          line.map { |el| { live: (el == 1) } }
        end
      end
    end

    def predict_next_state
      each_with_index do |line, i|
        line.each_with_index do |el, j|
          neighbors = neighbors(i, j)
          live_neighbors = neighbors.count { |neighbor| neighbor[:live] }

          el[:live_neighbors] = live_neighbors
          el[:live_in_feature] = possible_neighbors_count_for_live.include?(live_neighbors)
        end
      end
    end

    def [](index)
      array[index]
    end

    def each(&block)
      array.each(&block)
    end

    private

    def possible_neighbors_count_for_live
      [2, 3]
    end

    def lines_count
      count
    end

    def column_count
      first.count
    end

    def neighbors(i, j)
      prev_line = prev_line(i)
      prev_column = prev_column(j)
      next_line = next_line(i)
      next_column = next_column(j)

      [
        self[prev_line][prev_column], self[prev_line][j], self[prev_line][next_column], 
        self[i][prev_column], self[i][next_column], 
        self[next_line][prev_column], self[next_line][j], self[next_line][next_column], 
      ]
    end

    def prev_line(i)
      i == 0 ? last_line_index : i - 1
    end

    def prev_column(j)
      j == 0 ? last_column_index : j - 1
    end

    def next_line(i)
      i == last_line_index ? 0 : i + 1
    end

    def next_column(j)
      j == last_column_index ? 0 : j + 1 
    end

    def last_column_index
      column_count - 1
    end

    def last_line_index
      lines_count - 1
    end
  end
end
