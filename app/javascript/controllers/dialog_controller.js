import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["dialog"]
  static values = { opened: Boolean }

  connect() {
    this.handleKeydownBinding = this.handleKeydown.bind(this);
    this.render();
  }

  render() {
    if (this.openedValue === true) {
      this.dialogTarget.setAttribute("open", true);
    } else {
      this.dialogTarget.removeAttribute("open");
    }
  }

  open() {
    this.openedValue = true;
    document.addEventListener("keydown", this.handleKeydownBinding);
    this.render();
  }

  close() {
    this.openedValue = false;
    document.removeEventListener("keydown", this.handleKeydownBinding);
    this.render();
  }

  handleKeydown(event) {
    if (event.keyCode == 27) {
      this.close();
    }
  }
}
