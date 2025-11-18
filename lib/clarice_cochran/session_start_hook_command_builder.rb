# frozen_string_literal: true

module ClariceCochran
  class SessionStartHookCommandBuilder
    include DataParsingMethods

    def initialize(data)
      @data = data
    end

    def to_osascript
      "osascript -e 'display notification \"#{message}\" with title \"Claude Code\" subtitle \"処理開始\" sound name \"Hero\"'"
    end
  end
end
