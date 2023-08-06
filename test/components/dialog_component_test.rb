# frozen_string_literal: true

require "test_helper"

class DialogComponentTest < ViewComponent::TestCase
  test "renders, opened: false" do
    component = DialogComponent.new.tap do |c|
      c.with_open_dialog_button("Open me!", class: "open-button-class")
      c.with_dialog_body { "Incredible content" }
      c.with_close_dialog_button("Close me", class: "close-button-class")
    end

    render_inline component

    assert_selector "[data-controller]", count: 1 do |element|
      assert_equal "false", element["data-dialog-opened-value"]
    end

    assert_button "Open me!", class: "open-button-class"
    assert_selector "dialog", text: "Incredible content"
    assert_button "Close me", class: "close-button-class"
  end

  test "renders, opened: true" do
    render_inline DialogComponent.new(opened: true)

    assert_selector "[data-controller]", count: 1 do |element|
      assert_equal "true", element["data-dialog-opened-value"]
    end
  end
end
