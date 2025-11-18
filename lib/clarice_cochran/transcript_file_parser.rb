# frozen_string_literal: true

module ClariceCochran
  class TranscriptFileParser
    def initialize(transcript_path)
      @transcript_path = transcript_path
    end

    def read
      File.read(@transcript_path)
    end

    def lines
      read.split("\n")
    end
  end
end
