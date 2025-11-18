# frozen_string_literal: true

module ClariceCochran
  class SessionEndHookCommandBuilder
    def to_osascript
      'osascript -e \'display notification "セッションが終了しました" with title "Claude Code" subtitle "処理終了" sound name "Hero"\''
    end
  end
end
