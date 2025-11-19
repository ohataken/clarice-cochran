# frozen_string_literal: true

module ClariceCochran
  class SessionEndHookCommandBuilder < BaseBuilder
    include DataParsingMethods

    def initialize(data)
      @data = data
    end

    def to_osascript
      "osascript -e 'display notification \"#{message}\" with title \"#{hook_event_name} - Claude Code\" sound name \"Tink\"'"
    end
  end
end
