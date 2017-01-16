class Live
  class Reader
    def self.perform(filename)
      read_file(filename)
      init_state
    end

    def self.read_file(filename)
      @array = []
      File.open(filename, "r") do |file|
        while line = file.gets
          @array << line.split(/[ \n]?/).collect(&:to_i)
        end
      end
    end
    private_class_method :read_file

    def self.init_state
      State.build_from_array(@array)
    end
    private_class_method :init_state
  end
end
