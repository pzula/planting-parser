module PlantingParser
  class Parser

    def parse_file(filename)
      rows = open_file(filename)
     # events = rows.collect {|row| calendar_builder(row) }
    end

    def open_file(filename)
      CSV.open(filename, :headers => true, :header_converters => :symbol)
    end

    def date_splitter(dates)
      dates.split('-').map do |date|
        Time.parse(date)
      end
    end

    def calendar_title(title)

    end

    def calendar_builder(data)
     # action = actions([data[:direct_seed], data[:start], data[:transplant]])
      #calendar_title( )
    end

    def actions(headers)
      if !headers[0].nil?
        return 'Direct Seed'
      elsif !headers[1].nil?
        return 'Start'
      elsif !headers[2].nil?
        return 'Transplant'
      end
    end
  end
end
