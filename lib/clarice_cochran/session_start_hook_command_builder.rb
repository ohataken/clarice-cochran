# frozen_string_literal: true

module ClariceCochran
  class SessionStartHookCommandBuilder < BaseBuilder
    include DataParsingMethods

    def initialize(data)
      @data = data
    end

    def to_osascript
      "osascript -e 'display notification \"at #{current_working_directory_path.basename}\" with title \"Claude - #{hook_event_name}\" sound name \"Tink\"'"
    end
  end
end
