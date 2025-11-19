# frozen_string_literal: true

module ClariceCochran
  class SessionStartHookCommandBuilder < BaseBuilder
    include DataParsingMethods

    def initialize(data)
      @data = data
    end

    def to_osascript
      "osascript -e 'display notification \"#{message}\" with title \"#{hook_event_name} - Claude Code\" subtitle \"処理開始\" sound name \"Tink\"'"
    end
  end
end
