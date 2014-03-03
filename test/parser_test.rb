require_relative './test_helper'

describe PlantingParser::Parser do
  it('parses a data file') { PlantingParser::Parser.new.parse_file('./test/fixtures/FakerSchedule_2014.csv').count.must_equal(49)}
end
