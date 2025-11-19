# frozen_string_literal: true

module ClariceCochran
  class NotificationHookCommandBuilder < BaseBuilder
    include DataParsingMethods

    def initialize(data)
      @data = data
    end

    def to_osascript
      "osascript -e 'display notification \"#{latest_message_content_text}\" with title \"#{hook_event_name} - Claude Code\" subtitle \"#{notification_type}\" sound name \"Tink\"'"
    end

    private

    def latest_transcript_with_message
      transcript_file_parser.latest_assistant_transcript_with_message
    end

    def latest_message_content_text
      transcript = latest_transcript_with_message
      transcript.message_contents.last.message
    end
  end
end
