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

    def text
      @json["text"] || ""
    end

    def input
      @json["input"] || {}
    end

    # @todo
    def message
      if type_tool_use?
        input["description"] || ""
      else
        text
      end
    end
  end
end
