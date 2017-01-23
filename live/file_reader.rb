module Live
  class FileReader
    AVAILABLE_STATES = %w(0 1)
    def read_file(file_name)
      data = File
        .read(file_name)
        .split("\n")
        .map { |row| row.split("")  }

      if data.map { |row| row.length }.uniq.length != 1
        raise ArgumentError.new("Input array should have equal lines by count")
      end

      if data.any? { |row| row.any? { |col| !AVAILABLE_STATES.include?(col) } }
        raise ArgumentError.new("Input array should contain only 1 and 0")
      end

      data
    end
  end
end
