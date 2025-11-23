# frozen_string_literal: true

module ClariceCochran
  module TranscriptTypeMethods
    def type_user?
      @data["type"] == "user"
    end

    def type_assistant?
      @data["type"] == "assistant"
    end
  end
end
