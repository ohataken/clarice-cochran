# frozen_string_literal: true

module ClariceCochran
  class TranscriptParser
    include TranscriptTypeMethods

    def initialize(json)
      @data = json
    end

    def timestamp
      @timestamp ||= Time.new(@data["timestamp"] || 0)
    end

    def message
      @data["message"] || {}
    end

    def message_contents
      return [] unless message["content"].is_a?(Array)
      @message_contents ||= message["content"].map { |c| TranscriptMessageContentParser.new(c) }
    end
  end
end
