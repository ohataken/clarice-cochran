# frozen_string_literal: true

module ClariceCochran
  class StopHookCommandBuilder < BaseBuilder
    include DataParsingMethods
    include TranscriptFileParsingMethods

    def initialize(data)
      @data = data
    end

    def to_osascript
      "osascript -e 'display notification \"#{latest_message_content_text}\" with title \"Claude - #{hook_event_name}\" sound name \"Tink\"'"
    end
  end
end
