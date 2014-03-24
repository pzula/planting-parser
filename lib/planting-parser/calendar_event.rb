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

    def post(title, start_time, end_time)
      event = cal.create_event do |e|
        e.title = title
        e.start_time = start_time
        e.end_time = end_time
      end
      puts event
    end
  end
end
