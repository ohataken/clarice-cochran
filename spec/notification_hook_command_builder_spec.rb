# frozen_string_literal: true

require "spec_helper"

RSpec.describe ClariceCochran::NotificationHookCommandBuilder do
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
