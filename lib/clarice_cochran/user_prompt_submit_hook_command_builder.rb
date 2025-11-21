# frozen_string_literal: true

module ClariceCochran
  class UserPromptSubmitHookCommandBuilder < BaseBuilder
    include DataParsingMethods

    def initialize(data)
      @data = data
    end

    def to_osascript
      "osascript -e 'display notification \"#{prompt}\" with title \"#{hook_event_name} - Claude Code\" subtitle \"#{notification_type}\" sound name \"Tink\"'"
    end
  end
end
