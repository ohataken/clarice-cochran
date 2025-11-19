# frozen_string_literal: true

module ClariceCochran
  class SessionEndHookCommandBuilder < BaseBuilder
    include DataParsingMethods

    def initialize(data)
      @data = data
    end

    def to_osascript
      "osascript -e 'display notification \"#{message}\" with title \"Claude Code\" subtitle \"処理終了\" sound name \"Tink\"'"
    end
  end
end
