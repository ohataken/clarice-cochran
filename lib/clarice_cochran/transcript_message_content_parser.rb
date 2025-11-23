# frozen_string_literal: true

module ClariceCochran
  class TranscriptMessageContentParser
    include TranscriptMessageContentParsingMethods
    include TranscriptMessageContentTypeMethods

    def initialize(json)
      @json = json
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
