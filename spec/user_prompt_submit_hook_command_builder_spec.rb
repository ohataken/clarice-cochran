# frozen_string_literal: true

require "spec_helper"

RSpec.describe ClariceCochran::UserPromptSubmitHookCommandBuilder do
  describe "#session_id" do
    it "returns the session_id value" do
      data = JSON.parse('{ "session_id": "12345" }')
      builder = ClariceCochran::UserPromptSubmitHookCommandBuilder.new(data)
      expect(builder.session_id).to eq("12345")
    end
  end

  describe "#transcript_path" do
    it "returns the transcript_path value" do
      data = JSON.parse('{ "transcript_path": "/path/to/transcript" }')
      builder = ClariceCochran::UserPromptSubmitHookCommandBuilder.new(data)
      expect(builder.transcript_path).to eq("/path/to/transcript")
    end
  end

  describe "#current_working_directory" do
    it "returns the cwd value" do
      data = JSON.parse('{ "cwd": "/path/to/cwd" }')
      builder = ClariceCochran::UserPromptSubmitHookCommandBuilder.new(data)
      expect(builder.current_working_directory).to eq("/path/to/cwd")
    end
  end

  describe "#permission_mode" do
    it "returns the permission_mode value" do
      data = JSON.parse('{ "permission_mode": "plan" }')
      builder = ClariceCochran::UserPromptSubmitHookCommandBuilder.new(data)
      expect(builder.permission_mode).to eq("plan")
    end
  end

  describe "#hook_event_name" do
    it "returns the hook_event_name value" do
      data = JSON.parse('{ "hook_event_name": "UserPromptSubmit" }')
      builder = ClariceCochran::UserPromptSubmitHookCommandBuilder.new(data)
      expect(builder.hook_event_name).to eq("UserPromptSubmit")
    end
  end

  describe "#prompt" do
    it "returns the prompt value" do
      data = JSON.parse('{ "prompt": "build して install して" }')
      builder = ClariceCochran::UserPromptSubmitHookCommandBuilder.new(data)
      expect(builder.prompt).to eq("build して install して")
    end
  end

  describe "#message" do
    it "returns the message value" do
      data = JSON.parse('{ "message": "hi" }')
      builder = ClariceCochran::UserPromptSubmitHookCommandBuilder.new(data)
      expect(builder.message).to eq("hi")
    end

    it "returns empty string when message key is not present" do
      data = JSON.parse("{}")
      builder = ClariceCochran::UserPromptSubmitHookCommandBuilder.new(data)
      expect(builder.message).to eq("")
    end
  end
end
