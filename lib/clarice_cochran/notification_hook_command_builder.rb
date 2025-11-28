# frozen_string_literal: true

module ClariceCochran
  class NotificationHookCommandBuilder < BaseBuilder
    include DataParsingMethods
    include NotificationTypeMethods
    include SoundNameOptions

    def initialize(data)
      @data = data
    end

    def oascript_sound_name_option
      sound_name(sound_name_for_message_content) && "sound name \"#{sound_name(sound_name_for_message_content)}\""
    end

    def sound_name_for_message_content
      content = latest_message_content
      return :tink if content.nil?

      if content.type_tool_use?
        :bottle
      elsif content.type_tool_result?
        :hero
      else
        :tink
      end
    end

    def latest_message_content
      latest_transcript&.message_contents&.last
    end

    def to_osascript
      "osascript -e 'display notification \"#{latest_message_content_text}\" with title \"#{message}\" #{oascript_sound_name_option}'"
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
