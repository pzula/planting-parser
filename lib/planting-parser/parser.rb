module PlantingParser
  class Parser

    def parse_file(filename)
      open_file(filename)
    end

    def open_file(filename)
      CSV.open(filename, :headers => true, :header_converters => :symbol)
    end

  end
end
