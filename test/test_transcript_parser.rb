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

  def test_type_user?
    json = JSON.parse('{ "type": "user" }')
    parser = ClariceCochran::TranscriptParser.new(json)
    assert(parser.type_user?)
  end

  def test_message
    json = JSON.parse('{ "message": { "content": [] } }')
    parser = ClariceCochran::TranscriptParser.new(json)
    assert(parser.message.key?("content"))
  end

  def test_message_with_empty_value
    json = JSON.parse("{}")
    parser = ClariceCochran::TranscriptParser.new(json)
    assert_equal({}, parser.message)
  end

  def test_message_contents_with_empty_content
    json = JSON.parse('{ "message": { "content": [] } }')
    parser = ClariceCochran::TranscriptParser.new(json)
    assert_equal([], parser.message_contents)
  end

  def test_message_contents_with_valid_content
    json = JSON.parse('{ "message": { "content": [{ "type": "text", "text": "hoge" }] } }')
    parser = ClariceCochran::TranscriptParser.new(json)
    assert(parser.message_contents.is_a?(Array))
    assert_equal(1, parser.message_contents.length)
    assert(parser.message_contents.first.is_a?(ClariceCochran::TranscriptMessageContentParser))
  end
end
