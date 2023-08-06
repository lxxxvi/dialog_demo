class DialogComponentPreview < ViewComponent::Preview
  def with_closed
    render DialogComponent.new(opened: false) do |c|
      c.with_open_dialog_button "Open the preview"
      c.with_dialog_body { "I wonder what goes here" }
      c.with_close_dialog_button "Close the preview"
    end
  end

  def with_opened
    render DialogComponent.new(opened: true) do |c|
      c.with_open_dialog_button "Open the preview"
      c.with_dialog_body { "This dialog should be opened already" }
      c.with_close_dialog_button "Close it, please"
    end
  end
end
