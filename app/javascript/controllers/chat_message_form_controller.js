import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="chat-message-form"
export default class extends Controller {
  connect() {
  }

  reset() {
    this.element.reset();
  }
}
