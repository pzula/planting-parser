module PlantingParser
  class Event
    attr_reader :cal

    def initialize
      @cal = Google::Calendar.new(:username => ENV['GCAL_USERNAME'],
                                  :password => ENV['GCAL_PASSWORD'],
                                  :app_name => ENV['GCAL_APPNAME'])
    end

    def post(title, dates)
      event = cal.create_event do |e|
        e.title = title
        e.start_time = dates[0]
        if dates[1]
          e.end_time = dates[1]
        end
      end
      puts event
    end
  end
end
