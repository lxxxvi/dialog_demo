class DialogComponent < ViewComponent::Base
  renders_one :open_dialog_button, "OpenButton"
  renders_one :dialog_body
  renders_one :close_dialog_button, "CloseButton"

  def initialize(opened: false)
    @opened = opened
  end

  def opened?
    @opened
  end

  class ButtonComponent < ViewComponent::Base
    DEFAULT_ATTRIBUTES = { class: "default-button" }.freeze
    OVERRIDE_ATTRIBUTES = {}.freeze

    def initialize(text, **custom_options)
      @text = text
      @custom_options = custom_options
    end

    def call
      button_tag(text, **options)
    end

    private

    attr_reader :text, :custom_options

    def options
      custom_options.with_defaults(self.class::DEFAULT_ATTRIBUTES)
                    .merge(self.class::OVERRIDE_ATTRIBUTES)
    end
  end

  class OpenButton < ButtonComponent
    OVERRIDE_ATTRIBUTES = { "data-action": "dialog#open" }.freeze
  end

  class CloseButton < ButtonComponent
    OVERRIDE_ATTRIBUTES = { "data-action": "dialog#close" }.freeze
  end
end
