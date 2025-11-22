# frozen_string_literal: true

require "spec_helper"

RSpec.describe ClariceCochran::SessionEndHookCommandBuilder do
  describe "#session_id" do
    it "returns the session_id value" do
      data = JSON.parse('{ "session_id": "12345" }')
      builder = ClariceCochran::SessionEndHookCommandBuilder.new(data)
      expect(builder.session_id).to eq("12345")
    end
  end

  describe "#transcript_path" do
    it "returns the transcript_path value" do
      data = JSON.parse('{ "transcript_path": "/path/to/transcript.jsonl" }')
      builder = ClariceCochran::SessionEndHookCommandBuilder.new(data)
      expect(builder.transcript_path).to eq("/path/to/transcript.jsonl")
    end
  end

  describe "#current_working_directory" do
    it "returns the cwd value" do
      data = JSON.parse('{ "cwd": "/Users/testuser/project" }')
      builder = ClariceCochran::SessionEndHookCommandBuilder.new(data)
      expect(builder.current_working_directory).to eq("/Users/testuser/project")
    end
  end

  describe "#hook_event_name" do
    it "returns the hook_event_name value" do
      data = JSON.parse('{ "hook_event_name": "SessionEnd" }')
      builder = ClariceCochran::SessionEndHookCommandBuilder.new(data)
      expect(builder.hook_event_name).to eq("SessionEnd")
    end
  end

  describe "#reason" do
    it "returns the reason value" do
      data = JSON.parse('{ "reason": "prompt_input_exit" }')
      builder = ClariceCochran::SessionEndHookCommandBuilder.new(data)
      expect(builder.reason).to eq("prompt_input_exit")
    end
  end

  describe "#message" do
    it "returns the message value" do
      data = JSON.parse('{ "message": "hi" }')
      builder = ClariceCochran::SessionEndHookCommandBuilder.new(data)
      expect(builder.message).to eq("hi")
    end

    it "returns empty string when message key is not present" do
      data = JSON.parse("{}")
      builder = ClariceCochran::SessionEndHookCommandBuilder.new(data)
      expect(builder.message).to eq("")
    end
  end
end
