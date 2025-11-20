# frozen_string_literal: true

require "spec_helper"

RSpec.describe ClariceCochran::TranscriptMessageContentParser do
  describe "#type_tool_use?" do
    it "returns true when type is tool_use" do
      json = {"type" => "tool_use"}
      parser = ClariceCochran::TranscriptMessageContentParser.new(json)
      expect(parser.type_tool_use?).to be true
    end
  end

  describe "#type_text?" do
    it "returns true when type is text" do
      json = {"type" => "text"}
      parser = ClariceCochran::TranscriptMessageContentParser.new(json)
      expect(parser.type_text?).to be true
    end
  end

  describe "#text" do
    it "returns the text value" do
      json = {"text" => "Hello, world!"}
      parser = ClariceCochran::TranscriptMessageContentParser.new(json)
      expect(parser.text).to eq("Hello, world!")
    end
  end
end
