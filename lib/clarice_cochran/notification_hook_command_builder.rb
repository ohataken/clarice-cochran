# frozen_string_literal: true

module ClariceCochran
  class NotificationHookCommandBuilder
    include DataParsingMethods

    def initialize(data)
      @data = data
    end

    def to_osascript
      "osascript -e 'display notification \"#{message}\" with title \"Claude Code\" subtitle \"お知らせ\" sound name \"Hero\"'"
    end
  end
end
