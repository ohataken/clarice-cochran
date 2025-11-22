# frozen_string_literal: true

module ClariceCochran
  module TranscriptFileParsingMethods
    def latest_transcript
      transcript_file_parser.latest_assistant_transcript
    end

    def latest_message_content_text
      transcript = latest_transcript
      transcript.message_contents.last.message
    end
  end
end
