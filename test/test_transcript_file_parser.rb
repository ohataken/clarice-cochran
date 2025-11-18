# frozen_string_literal: true

require "test_helper"

class TestTranscriptFileParser < Minitest::Test
  def test_lines_with_valid_file
    parser = ClariceCochran::TranscriptFileParser.new("transcript.jsonl")

    parser.stub(:read, "{}\n{}") do
      assert_equal 2, parser.parse.size
    end
  end
end
