# frozen_string_literal: true

module ClariceCochran
  class TranscriptMessageContentParser
    include TranscriptMessageContentParsingMethods

    def initialize(json)
      @json = json
    end

    def type_tool_use?
      type == "tool_use"
    end

    def type_text?
      type == "text"
    end

    def type_thinking?
      type == "thinking"
    end

    def type_tool_result?
      type == "tool_result"
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

    def shell_safe_message
      message.gsub("\"", "\\\"")
    end
  end
end
