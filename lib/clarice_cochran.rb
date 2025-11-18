# frozen_string_literal: true

require_relative "clarice_cochran/version"
require_relative "clarice_cochran/session_start_hook_command_builder"
require_relative "clarice_cochran/session_end_hook_command_builder"
require_relative "clarice_cochran/notification_hook_command_builder"
require_relative "clarice_cochran/stop_hook_command_builder"

module ClariceCochran
  class Error < StandardError; end
  # Your code goes here...
end
