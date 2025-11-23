# frozen_string_literal: true

module ClariceCochran
  module TranscriptTypeMethods
    def type_user?
      @json["type"] == "user"
    end

    def type_assistant?
      @json["type"] == "assistant"
    end
  end
end
