require_relative './test_helper'

describe PlantingParser::Parser do
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
    parsed_row = parser.parse_file('./test/fixtures/FakerSchedule_2014.csv').first

    headers = [parsed_row[:direct_seed], parsed_row[:start], parsed_row[:transplant]]

    parser.actions(headers).must_equal('Start')
  end

  it('forms the correct calendar item title') do
    skip
    parser = PlantingParser::Parser.new
    item = parser.parse_file('./test/fixtures/FakerSchedule_2014.csv').first
    item.calendar_title.must_equal('Start DiCicco Broccoli')
  end
end
