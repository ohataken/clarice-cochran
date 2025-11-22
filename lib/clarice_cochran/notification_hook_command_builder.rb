# frozen_string_literal: true

module ClariceCochran
  class NotificationHookCommandBuilder < BaseBuilder
    include DataParsingMethods
    include TranscriptFileParsingMethods

    def initialize(data)
      @data = data
    end

    def permission_prompt?
      notification_type == "permission_prompt"
    end

    def idle_prompt?
      notification_type == "idle_prompt"
    end

    def to_osascript
      "osascript -e 'display notification \"#{latest_message_content_text}\" with title \"#{message}\" sound name \"Tink\"'"
    end
  end
end
