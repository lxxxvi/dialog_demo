require "application_system_test_case"

class DialogComponentsTest < ApplicationSystemTestCase
  test "it opens the closed dialog" do
    visit "/rails/view_components/dialog_component/with_closed"

    assert_no_selector "dialog"

    click_on "Open the preview"

    assert_selector "dialog", text: "I wonder what goes here"

    click_on "Close the preview"

    assert_no_selector "dialog"
  end

  test "it closes the already opened dialog, and opens it again" do
    visit "/rails/view_components/dialog_component/with_opened"

    assert_selector "dialog", text: "This dialog should be opened already"

    click_on "Close it, please"

    assert_no_selector "dialog"

    click_on "Open the preview"

    assert_selector "dialog", text: "This dialog should be opened already"
  end

  test "it closes the already opened dialog by pressing escape" do
    visit "/rails/view_components/dialog_component/with_opened"

    assert_selector "dialog", text: "This dialog should be opened already"

    find("body").native.send_key(:escape)

    assert_no_selector "dialog"
  end

  test "it closes the already opened dialog by clicking outside of the content" do
    visit "/rails/view_components/dialog_component/with_opened"

    assert_selector "dialog", text: "This dialog should be opened already"

    execute_script(
      <<~JS
      const event = new MouseEvent('click', {
        'view': window,
        'bubbles': true,
        'cancelable': true,
        'screenX': 1,
        'screenY': 1
      });

      const element = document.elementFromPoint(1, 1);
      element.dispatchEvent(event);
    JS
    )

    assert_no_selector "dialog"
  end
end
