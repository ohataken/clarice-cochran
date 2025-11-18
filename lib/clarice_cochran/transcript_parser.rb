# frozen_string_literal: true

module ClariceCochran
  class TranscriptParser
    def initialize(json)
      @json = json
    end

    def timestamp
      @timestamp ||= Time.new(@json["timestamp"] || 0)
    end
  end
end
