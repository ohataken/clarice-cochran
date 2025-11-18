# frozen_string_literal: true

module ClariceCochran
  class BaseBuilder
    def transcript_file_parser
      @transcript_file_parser ||= TranscriptFileParser.new(transcript_path)
    end
  end
end
