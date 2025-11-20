# frozen_string_literal: true

require "spec_helper"

RSpec.describe ClariceCochran::TranscriptFileParser do
  describe "#parse" do
    it "returns correct number of lines with valid file" do
      parser = ClariceCochran::TranscriptFileParser.new("transcript.jsonl")
      allow(parser).to receive(:read).and_return("{}\n{}")
      expect(parser.parse.size).to eq(2)
    end
  end
end
