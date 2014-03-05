module PlantingParser
  class Parser

    def parse_file(filename)
      rows = open_file(filename)
      #@events = rows.collect {|row| calendar_builder(row) }
    end

    def open_file(filename)
      CSV.open(filename, :headers => true, :header_converters => :symbol)
    end

    def date_splitter(dates)
      dates.split('-').map do |date|
        Time.parse(date)
      end
    end

    #def calendar_title(title)

    #end

    #def calendar_builder(data)
      ### check if it is direct seed, start, or transplant

      #calendar_title(data[])
    #end
  end
end
