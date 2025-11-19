# frozen_string_literal: true

require "test_helper"

class TestTranscriptMessageContentParser < Minitest::Test
  def test_type_tool_use?
    json = {"type" => "tool_use"}
    parser = ClariceCochran::TranscriptMessageContentParser.new(json)
    assert parser.type_tool_use?
  end

  def test_type_text?
    json = {"type" => "text"}
    parser = ClariceCochran::TranscriptMessageContentParser.new(json)
    assert parser.type_text?
  end

  def test_text
    json = {"text" => "Hello, world!"}
    parser = ClariceCochran::TranscriptMessageContentParser.new(json)
    assert_equal "Hello, world!", parser.text
  end
end
