# frozen_string_literal: true

require "spec_helper"

RSpec.describe ClariceCochran::NotificationHookCommandBuilder do
  describe "#session_id" do
    it "returns the session_id value" do
      data = {"session_id" => "12345"}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.session_id).to eq("12345")
    end
  end

  describe "#transcript_path" do
    it "returns the transcript_path value" do
      data = {"transcript_path" => "/path/to/transcript.jsonl"}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.transcript_path).to eq("/path/to/transcript.jsonl")
    end
  end

  describe "#current_working_directory" do
    it "returns the cwd value" do
      data = {"cwd" => "/Users/testuser/project"}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.current_working_directory).to eq("/Users/testuser/project")
    end
  end

  describe "#hook_event_name" do
    it "returns the hook_event_name value" do
      data = {"hook_event_name" => "Notification"}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.hook_event_name).to eq("Notification")
    end
  end

  describe "#message" do
    it "returns the message value" do
      data = {"message" => "hi"}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.message).to eq("hi")
    end

    it "returns empty string when message key is not present" do
      data = {}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.message).to eq("")
    end
  end

  describe "#notification_type" do
    it "returns the notification_type value" do
      data = {"notification_type" => "permission_prompt"}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.notification_type).to eq("permission_prompt")
    end
  end

  describe "#permission_prompt?" do
    it "returns true when notification_type is permission_prompt" do
      data = {"notification_type" => "permission_prompt"}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.permission_prompt?).to be true
    end

    it "returns false when notification_type is idle_prompt" do
      data = {"notification_type" => "idle_prompt"}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.permission_prompt?).to be false
    end

    it "returns false when notification_type is not present" do
      data = {}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.permission_prompt?).to be false
    end
  end

  describe "#idle_prompt?" do
    it "returns true when notification_type is idle_prompt" do
      data = {"notification_type" => "idle_prompt"}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.idle_prompt?).to be true
    end

    it "returns false when notification_type is permission_prompt" do
      data = {"notification_type" => "permission_prompt"}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.idle_prompt?).to be false
    end

    it "returns false when notification_type is not present" do
      data = {}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      expect(builder.idle_prompt?).to be false
    end
  end

  describe "#sound_name_for_message_content" do
    it "returns :tink when latest_message_content is nil" do
      data = {}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      allow(builder).to receive(:latest_message_content).and_return(nil)
      expect(builder.sound_name_for_message_content).to eq(:tink)
    end

    it "returns :bottle when type_tool_use? is true" do
      data = {}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      content = ClariceCochran::TranscriptMessageContentParser.new({"type" => "tool_use"})
      allow(builder).to receive(:latest_message_content).and_return(content)
      expect(builder.sound_name_for_message_content).to eq(:bottle)
    end

    it "returns :tink when type_text? is true" do
      data = {}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      content = ClariceCochran::TranscriptMessageContentParser.new({"type" => "text"})
      allow(builder).to receive(:latest_message_content).and_return(content)
      expect(builder.sound_name_for_message_content).to eq(:tink)
    end

    it "returns :tink when type_thinking? is true" do
      data = {}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      content = ClariceCochran::TranscriptMessageContentParser.new({"type" => "thinking"})
      allow(builder).to receive(:latest_message_content).and_return(content)
      expect(builder.sound_name_for_message_content).to eq(:tink)
    end

    it "returns :hero when type_tool_result? is true" do
      data = {}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      content = ClariceCochran::TranscriptMessageContentParser.new({"type" => "tool_result"})
      allow(builder).to receive(:latest_message_content).and_return(content)
      expect(builder.sound_name_for_message_content).to eq(:hero)
    end
  end

  describe "#oascript_sound_name_option" do
    it "returns sound name option with Bottle when type_tool_use?" do
      data = {}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      content = ClariceCochran::TranscriptMessageContentParser.new({"type" => "tool_use"})
      allow(builder).to receive(:latest_message_content).and_return(content)
      expect(builder.oascript_sound_name_option).to eq('sound name "Bottle"')
    end

    it "returns sound name option with Tink when type_text?" do
      data = {}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      content = ClariceCochran::TranscriptMessageContentParser.new({"type" => "text"})
      allow(builder).to receive(:latest_message_content).and_return(content)
      expect(builder.oascript_sound_name_option).to eq('sound name "Tink"')
    end

    it "returns sound name option with Tink when type_thinking?" do
      data = {}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      content = ClariceCochran::TranscriptMessageContentParser.new({"type" => "thinking"})
      allow(builder).to receive(:latest_message_content).and_return(content)
      expect(builder.oascript_sound_name_option).to eq('sound name "Tink"')
    end

    it "returns sound name option with Hero when type_tool_result?" do
      data = {}
      builder = ClariceCochran::NotificationHookCommandBuilder.new(data)
      content = ClariceCochran::TranscriptMessageContentParser.new({"type" => "tool_result"})
      allow(builder).to receive(:latest_message_content).and_return(content)
      expect(builder.oascript_sound_name_option).to eq('sound name "Hero"')
    end
  end
end
