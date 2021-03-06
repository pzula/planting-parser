module PlantingParser
  class Parser

    def parse_file(filename)
      rows = open_file(filename)
      event = rows.collect {|row| calendar_builder(row) }
      puts event
    end

    def open_file(filename)
      CSV.open(filename, :headers => true, :header_converters => :symbol)
    end

    def date_splitter(dates)
      return "" unless !dates.nil?
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
      title = calendar_title(data[:direct_seed],
                             data[:start],
                             data[:_starts],
                             data[:transplant],
                             data[:_plants],
                             data[:variety],
                             data[:crop])
      orig_dates = date_splitter(data[:date])
      alt_dates = date_splitter(data[:alt_dates])
      event = Event.new
      event.post(title, orig_dates)
      if !alt_dates.to_s.empty?
        event = Event.new
        event.post(title, alt_dates)
      end
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
