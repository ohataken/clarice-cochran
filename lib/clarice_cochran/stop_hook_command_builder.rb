# frozen_string_literal: true

module ClariceCochran
  class StopHookCommandBuilder < BaseBuilder
    include DataParsingMethods

    def initialize(data)
      @data = data
    end

    def to_osascript
      "osascript -e 'display notification \"at #{current_working_directory_path.basename}\" with title \"#{hook_event_name} - Claude Code\" sound name \"Tink\"'"
    end
  end
end
