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

    def parse
      @objects ||= lines.map { |l| TranscriptParser.new(JSON.parse(l)) }
    end

    def assistant_transcripts
      parse.filter do |transcript|
        transcript.type_assistant?
      end
    end

    def latest_assistant_transcript
      assistant_transcripts.max_by(&:timestamp)
    end
  end
end
