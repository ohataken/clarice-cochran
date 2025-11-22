# frozen_string_literal: true

module ClariceCochran
  module TranscriptMessageContentParsingMethods
    def type_tool_use?
      @json["type"] == "tool_use"
    end

    def type_text?
      @json["type"] == "text"
    end

    def type_thinking?
      @json["type"] == "thinking"
    end

    def type_tool_result?
      @json["type"] == "tool_result"
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
