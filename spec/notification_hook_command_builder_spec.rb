# frozen_string_literal: true

require "spec_helper"

RSpec.describe ClariceCochran::NotificationHookCommandBuilder do
  describe "#session_id" do
    it "returns the session_id value" do
      data = JSON.parse('{ "session_id": "12345" }')
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.session_id).to eq("12345")
    end
  end

  describe "#transcript_path" do
    it "returns the transcript_path value" do
      data = JSON.parse('{ "transcript_path": "/path/to/transcript.jsonl" }')
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.transcript_path).to eq("/path/to/transcript.jsonl")
    end
  end

  describe "#current_working_directory" do
    it "returns the cwd value" do
      data = JSON.parse('{ "cwd": "/Users/testuser/project" }')
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.current_working_directory).to eq("/Users/testuser/project")
    end
  end

  describe "#hook_event_name" do
    it "returns the hook_event_name value" do
      data = JSON.parse('{ "hook_event_name": "Notification" }')
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.hook_event_name).to eq("Notification")
    end
  end

  describe "#message" do
    it "returns the message value" do
      data = JSON.parse('{ "message": "hi" }')
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.message).to eq("hi")
    end

    it "returns empty string when message key is not present" do
      data = JSON.parse("{}")
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.message).to eq("")
    end
  end

  describe "#notification_type" do
    it "returns the notification_type value" do
      data = JSON.parse('{ "notification_type": "permission_prompt" }')
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.notification_type).to eq("permission_prompt")
    end
  end

  describe "#permission_prompt?" do
    it "returns true when notification_type is permission_prompt" do
      data = JSON.parse('{ "notification_type": "permission_prompt" }')
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.permission_prompt?).to be true
    end

    it "returns false when notification_type is idle_prompt" do
      data = JSON.parse('{ "notification_type": "idle_prompt" }')
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.permission_prompt?).to be false
    end

    it "returns false when notification_type is not present" do
      data = JSON.parse("{}")
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.permission_prompt?).to be false
    end
  end

  describe "#idle_prompt?" do
    it "returns true when notification_type is idle_prompt" do
      data = JSON.parse('{ "notification_type": "idle_prompt" }')
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.idle_prompt?).to be true
    end

    it "returns false when notification_type is permission_prompt" do
      data = JSON.parse('{ "notification_type": "permission_prompt" }')
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.idle_prompt?).to be false
    end

    it "returns false when notification_type is not present" do
      data = JSON.parse("{}")
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.idle_prompt?).to be false
    end
  end
end
