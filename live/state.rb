class Live
  class State
    attr_writer :array

    def self.build_from_array(array)
      new.tap do |state|
        state.array = array.map do |line|
          line.map { |el| { live: (el == 1) } }
        end
      end
    end

    def [](index)
      @array[index]
    end
  end
end
