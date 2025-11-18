# frozen_string_literal: true

require "test_helper"

class TestTranscriptParser < Minitest::Test
  def test_timestamp
    json = JSON.parse('{ "timestamp": "1991-06-28T08:57:17.175Z" }')
    parser = ClariceCochran::TranscriptParser.new(json)
    assert(parser.timestamp.is_a?(Time))
  end

  def test_timestamp_with_empty_value
    json = JSON.parse("{}")
    parser = ClariceCochran::TranscriptParser.new(json)
    assert(parser.timestamp.is_a?(Time))
  end

  def test_message
    json = JSON.parse('{ "message": { "content": [] } }')
    parser = ClariceCochran::TranscriptParser.new(json)
    assert(parser.message.key?("content"))
  end
end
