# frozen_string_literal: true

module ClariceCochran
  class StopHookCommandBuilder < BaseBuilder
    include DataParsingMethods

    def initialize(data)
      @data = data
    end

    def to_osascript
      "osascript -e 'display notification \"#{latest_message_content_text}\" with title \"Claude - #{hook_event_name}\" sound name \"Tink\"'"
    end

    private

    def latest_transcript
      transcript_file_parser.latest_assistant_transcript
    end

    def latest_message_content_text
      transcript = latest_transcript
      transcript.message_contents.last.shell_safe_message
    end
  end
end
