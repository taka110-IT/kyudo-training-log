import { Controller } from "@hotwired/stimulus"

import { Modal } from "bootstrap"

// Connects to data-controller="achievement-message-modal"
export default class extends Controller {
  connect () {
    this.modal = new Modal(this.element)
    this.modal.show()
  }

  close (event) {
    if (event.detail.success) {
      this.modal.hide()
    }
  }
}
