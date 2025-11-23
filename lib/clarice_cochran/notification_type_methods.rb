# frozen_string_literal: true

module ClariceCochran
  module NotificationTypeMethods
    def permission_prompt?
      notification_type == "permission_prompt"
    end

    def idle_prompt?
      notification_type == "idle_prompt"
    end
  end
end
