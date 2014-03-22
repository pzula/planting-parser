require_relative './test_helper'

describe PlantingParser::CalendarEvent do
  it('connects to the Google Calendar API') do
    title = 'Start 20 Di Cicco Broccoli'
    date = '2/17-2/19'

    CalendarEvent.new(title, date).must_equal("Successfully posted to Google")
  end
end
