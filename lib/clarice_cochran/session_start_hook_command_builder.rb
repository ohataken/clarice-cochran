# frozen_string_literal: true

module ClariceCochran
  class SessionStartHookCommandBuilder
    def initialize(data)
      @data = data
    end

    def to_osascript
      'osascript -e \'display notification "セッションが開始されました" with title "Claude Code" subtitle "処理開始" sound name "Hero"\''
    end
  end
end
