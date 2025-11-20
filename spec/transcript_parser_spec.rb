# frozen_string_literal: true

require "spec_helper"

RSpec.describe ClariceCochran::TranscriptParser do
  describe "#timestamp" do
    it "returns a Time object with valid timestamp" do
      json = JSON.parse('{ "timestamp": "1991-06-28T08:57:17.175Z" }')
      parser = ClariceCochran::TranscriptParser.new(json)
      expect(parser.timestamp).to be_a(Time)
    end

    it "returns a Time object with empty value" do
      json = JSON.parse("{}")
      parser = ClariceCochran::TranscriptParser.new(json)
      expect(parser.timestamp).to be_a(Time)
    end
  end

  describe "#type_user?" do
    it "returns true when type is user" do
      json = JSON.parse('{ "type": "user" }')
      parser = ClariceCochran::TranscriptParser.new(json)
      expect(parser.type_user?).to be true
    end
  end

  describe "#type_assistant?" do
    it "returns true when type is assistant" do
      json = JSON.parse('{ "type": "assistant" }')
      parser = ClariceCochran::TranscriptParser.new(json)
      expect(parser.type_assistant?).to be true
    end
  end

  describe "#message" do
    it "returns message hash with content key" do
      json = JSON.parse('{ "message": { "content": [] } }')
      parser = ClariceCochran::TranscriptParser.new(json)
      expect(parser.message).to have_key("content")
    end

    it "returns empty hash when message is not present" do
      json = JSON.parse("{}")
      parser = ClariceCochran::TranscriptParser.new(json)
      expect(parser.message).to eq({})
    end
  end

  describe "#message_contents" do
    it "returns empty array with empty content" do
      json = JSON.parse('{ "message": { "content": [] } }')
      parser = ClariceCochran::TranscriptParser.new(json)
      expect(parser.message_contents).to eq([])
    end

    it "returns array of TranscriptMessageContentParser with valid content" do
      json = JSON.parse('{ "message": { "content": [{ "type": "text", "text": "hoge" }] } }')
      parser = ClariceCochran::TranscriptParser.new(json)
      expect(parser.message_contents).to be_an(Array)
      expect(parser.message_contents.length).to eq(1)
      expect(parser.message_contents.first).to be_a(ClariceCochran::TranscriptMessageContentParser)
    end
  end
end
