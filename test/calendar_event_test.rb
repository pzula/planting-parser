require_relative './test_helper'

describe PlantingParser::Event do
  def setup
    @parsed_row = {
      :date =>'2/17-2/19',
      :alt_dates => '3/31-4/2',
      :crop =>  "Broccoli",
      :location => nil,
      :direct_seed => nil,
      :start => "X",
      :transplant => nil,
      :_plants => "20",
      :_starts => "20",
      :variety => "Di Cicco"
    }
  end

  it('creates a properly formatted calendar event') do
    event = PlantingParser::Event.new
    event.post("Start 20 Di Cicco Brocolli", PlantingParser::Parser.new.date_splitter(@parsed_row[:date]))
  end

  it('creates a proper event without second date') do
    event = PlantingParser::Event.new
    event.post("Start 20 Di Cicco Brocolli", PlantingParser::Parser.new.date_splitter('2/28'))
  end
end
