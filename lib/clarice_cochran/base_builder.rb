# frozen_string_literal: true

module ClariceCochran
  class BaseBuilder
    def transcript_file_parser
      @transcript_file_parser ||= TranscriptFileParser.new(transcript_path)
    end

    def current_working_directory_path
      @current_working_directory_path ||= Pathname.new(current_working_directory)
    end
  end
end
