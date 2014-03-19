require_relative './test_helper'

describe PlantingParser::Parser do
  def setup
    @parsed_row = {
                  :date =>'2/1',
                  :alt_dates => nil,
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

  it('parses a data file') do
    PlantingParser::Parser.new.parse_file('./test/fixtures/FakerSchedule_2014.csv').count.must_equal(49)
  end

  it('finds planting dates with a range and splits them') do
    dates = '2/17-2/19'
    parser = PlantingParser::Parser.new

    parser.date_splitter(dates).must_equal([Time.parse('2/17'), Time.parse('2/19')])
  end

  it('builds the right actions from the headers') do
    parser = PlantingParser::Parser.new

    parser.actions(@parsed_row[:direct_seed], @parsed_row[:start], @parsed_row[:transplant]).must_equal('Start')
  end

  it('forms the correct calendar item title') do
    parser = PlantingParser::Parser.new
    title = parser.calendar_title(@parsed_row[:direct_seed],
                                  @parsed_row[:start],
                                  @parsed_row[:_starts],
                                  @parsed_row[:transplant],
                                  @parsed_row[:_plants],
                                  @parsed_row[:variety],
                                  @parsed_row[:crop])
    title.must_equal('Start 20 Di Cicco Broccoli')
  end

  it('creates a new CalendarEvent from each row') do
    parser = PlantingParser::Parser.new
    built_file = parser.parse_file('./test/fixtures/FakerSchedule_2014.csv')
    (built_file.count).must_equal(49)
  end
end
