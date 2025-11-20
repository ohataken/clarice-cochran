# frozen_string_literal: true

require "spec_helper"

RSpec.describe ClariceCochran::SessionEndHookCommandBuilder do
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
