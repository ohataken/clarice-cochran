# frozen_string_literal: true

module ClariceCochran
  module DataParsingMethods
    def session_id
      @data["session_id"] || ""
    end

    def transcript_path
      @data["transcript_path"] || ""
    end

    def current_working_directory
      @data["cwd"] || ""
    end

    def hook_event_name
      @data["hook_event_name"] || ""
    end

    def message
      @data["message"] || ""
    end

    def notification_type
      @data["notification_type"] || ""
    end
  end
end
