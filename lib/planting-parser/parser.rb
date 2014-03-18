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

    def calendar_title(direct_seed, start, number_starts, transplant, number_plants, variety, crop)
      action = actions(direct_seed, start, transplant)
      if action == 'Transplant' || action == 'Direct Seed'
        number = number_plants
      else
        number = number_starts
      end
      variety = variety
      crop = crop

      return "#{action} #{number} #{variety} #{crop}"
    end

    def calendar_builder(data)
      CalendarEvent.new(title, date)
    end

    def actions(direct_seed, start, transplant)
      if !direct_seed.nil?
        return 'Direct Seed'
      elsif !start.nil?
        return 'Start'
      elsif !transplant.nil?
        return 'Transplant'
      end
    end
  end
end
