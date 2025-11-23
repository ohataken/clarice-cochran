# frozen_string_literal: true

require "json"
require "pathname"
require_relative "clarice_cochran/version"
require_relative "clarice_cochran/transcript_message_content_parsing_methods"
require_relative "clarice_cochran/transcript_message_content_parser"
require_relative "clarice_cochran/transcript_type_methods"
require_relative "clarice_cochran/transcript_parser"
require_relative "clarice_cochran/transcript_file_parser"
require_relative "clarice_cochran/data_parsing_methods"
require_relative "clarice_cochran/base_builder"
require_relative "clarice_cochran/session_start_hook_command_builder"
require_relative "clarice_cochran/session_end_hook_command_builder"
require_relative "clarice_cochran/notification_hook_command_builder"
require_relative "clarice_cochran/stop_hook_command_builder"
require_relative "clarice_cochran/user_prompt_submit_hook_command_builder"

module ClariceCochran
  class Error < StandardError; end
  # Your code goes here...
end
