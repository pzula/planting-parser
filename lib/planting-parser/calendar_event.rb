module PlantingParser
  class CalendarEvent
    def initialize(title, date)
      e = Event.new
      e.post(title, date, Time.now)
    end
  end

  class Event
    attr_reader :cal

    def initialize
      @cal = Google::Calendar.new(:username => ENV['GCAL_USERNAME'],
                           :password => ENV['GCAL_PASSWORD'],
                           :app_name => ENV['GCAL_APPNAME'])
    end

    def post(title, start_date, end_date)
      event = cal.create_event do |e|
        e.title = title
        e.start_time = start_date
        if end_date
          e.end_time = end_date
        end
      end
      puts event
    end
  end
end
