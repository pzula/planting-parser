require_relative './test_helper'

describe PlantingParser::Parser do
  it('parses a data file') do
    PlantingParser::Parser.new.parse_file('./test/fixtures/FakerSchedule_2014.csv').count.must_equal(49)
  end

  it('finds planting dates with a range and splits them') do
    dates = '2/17-2/19'
    parser = PlantingParser::Parser.new

    parser.date_splitter(dates).must_equal(['2014-02-17 00:00:00 -0500','2014-02-19 00:00:00 -0500'])
  end

  it('forms the correct calendar item title') do
    parser = PlantingParser::Parser.new
    item = parser.parse_file('./test/fixtures/FakerSchedule_2014.csv').first
    item.calendar_title.must_equal('Start DiCicco Broccoli')
  end
end
