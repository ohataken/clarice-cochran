# frozen_string_literal: true

module ClariceCochran
  class StopHookCommandBuilder < BaseBuilder
    include DataParsingMethods
    include SoundNameOptions

    def initialize(data)
      @data = data
    end

    def oascript_sound_name_option
      sound_name(:tink) && "sound name \"#{sound_name(:tink)}\""
    end

    def to_osascript
      "osascript -e 'display notification \"#{latest_message_content_text}\" with title \"Claude - #{hook_event_name}\" #{oascript_sound_name_option}'"
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
