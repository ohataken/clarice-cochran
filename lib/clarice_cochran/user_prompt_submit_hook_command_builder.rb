# frozen_string_literal: true

module ClariceCochran
  class UserPromptSubmitHookCommandBuilder < BaseBuilder
    include DataParsingMethods
    include SoundNameOptions

    def initialize(data)
      @data = data
    end

    def oascript_sound_name_option
      sound_name(:tink) && "sound name \"#{sound_name(:tink)}\""
    end

    def to_osascript
      "osascript -e 'display notification \"#{prompt}\" with title \"Claude - #{hook_event_name}\" #{oascript_sound_name_option}'"
    end
  end
end
