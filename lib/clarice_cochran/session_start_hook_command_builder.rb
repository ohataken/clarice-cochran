# frozen_string_literal: true

module ClariceCochran
  class SessionStartHookCommandBuilder < BaseBuilder
    include DataParsingMethods
    include SoundNameOptions

    def initialize(data)
      @data = data
    end

    def oascript_sound_name_option
      ""
    end

    def to_osascript
      "osascript -e 'display notification \"at #{current_working_directory_path.basename}\" with title \"Claude - #{hook_event_name}\" #{oascript_sound_name_option}'"
    end
  end
end
