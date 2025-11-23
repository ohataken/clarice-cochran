# frozen_string_literal: true

require "spec_helper"

RSpec.describe ClariceCochran::StopHookCommandBuilder do
  describe "#session_id" do
    it "returns the session_id value" do
      data = {"session_id" => "12345"}
      builder = ClariceCochran::StopHookCommandBuilder.new(data)
      expect(builder.session_id).to eq("12345")
    end
  end

  describe "#transcript_path" do
    it "returns the transcript_path value" do
      data = {"transcript_path" => "/path/to/transcript.jsonl"}
      builder = ClariceCochran::StopHookCommandBuilder.new(data)
      expect(builder.transcript_path).to eq("/path/to/transcript.jsonl")
    end
  end

  describe "#current_working_directory" do
    it "returns the cwd value" do
      data = {"cwd" => "/Users/testuser/project"}
      builder = ClariceCochran::StopHookCommandBuilder.new(data)
      expect(builder.current_working_directory).to eq("/Users/testuser/project")
    end
  end

  describe "#permission_mode" do
    it "returns the permission_mode value" do
      data = {"permission_mode" => "default"}
      builder = ClariceCochran::StopHookCommandBuilder.new(data)
      expect(builder.permission_mode).to eq("default")
    end
  end

  describe "#hook_event_name" do
    it "returns the hook_event_name value" do
      data = {"hook_event_name" => "Stop"}
      builder = ClariceCochran::StopHookCommandBuilder.new(data)
      expect(builder.hook_event_name).to eq("Stop")
    end
  end

  describe "#stop_hook_active" do
    it "returns the stop_hook_active value" do
      data = {"stop_hook_active" => false}
      builder = ClariceCochran::StopHookCommandBuilder.new(data)
      expect(builder.stop_hook_active).to eq(false)
    end
  end

  describe "#message" do
    it "returns the message value" do
      data = {"message" => "hi"}
      builder = ClariceCochran::StopHookCommandBuilder.new(data)
      expect(builder.message).to eq("hi")
    end

    it "returns empty string when message key is not present" do
      data = {}
      builder = ClariceCochran::StopHookCommandBuilder.new(data)
      expect(builder.message).to eq("")
    end
  end
end
