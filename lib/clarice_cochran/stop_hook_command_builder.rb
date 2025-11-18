# frozen_string_literal: true

module ClariceCochran
  class StopHookCommandBuilder
    def initialize(data)
      @data = data
    end

    def to_osascript
      'osascript -e \'display notification "処理が停止しました" with title "Claude Code" subtitle "停止完了" sound name "Hero"\''
    end
  end
end
