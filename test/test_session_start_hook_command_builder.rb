# frozen_string_literal: true

require "test_helper"

class TestSessionStartHookCommandBuilder < Minitest::Test
  def test_message
    data = JSON.parse('{ "message": "hi" }')
    builder = ClariceCochran::SessionStartHookCommandBuilder.new(data)
    assert_equal "hi", builder.message
  end

  def test_message_without_message_key
    data = JSON.parse("{}")
    builder = ClariceCochran::SessionStartHookCommandBuilder.new(data)
    assert_equal "", builder.message
  end
end
