# frozen_string_literal: true

module ClariceCochran
  class TranscriptMessageContentParser
    def initialize(json)
      @json = json
    end

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

    # @todo
    def message
      if type_tool_use?
        input["description"] || input["plan"] || ""
      elsif type_thinking?
        thinking
      elsif type_tool_result?
        content
      else
        text
      end
    end
  end
end
