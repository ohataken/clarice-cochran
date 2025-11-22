# frozen_string_literal: true

module ClariceCochran
  module TranscriptMessageContentParsingMethods
    def type
      @json["type"] || ""
    end

    def text
      @json["text"] || ""
    end

    def input
      @json["input"] || {}
    end

    def thinking
      @json["thinking"] || ""
    end

    def content
      @json["content"] || ""
    end
  end
end
