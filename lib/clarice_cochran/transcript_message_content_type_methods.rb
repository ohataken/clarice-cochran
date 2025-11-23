# frozen_string_literal: true

module ClariceCochran
  module TranscriptMessageContentTypeMethods
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
  end
end
