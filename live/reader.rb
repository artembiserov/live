class Live
  class Reader
    def self.perform(filename)
      @array = []
      read_file(filename)
      State.build_from_array(@array)
    end

    def self.read_file(filename)
      File.open(filename, "r") do |file|
        while line = file.gets
          @array << line.split(/[ \n]?/).collect(&:to_i)
        end
      end
    end
    private_class_method :read_file
  end
end
