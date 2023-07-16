import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cutealert"
export default class extends Controller {
  static targets = ["input"]

  connect() {
  }

  successToast() {
    cuteToast({
      type: 'error',
      title: "Great",
      message: "Product was successfully added",
      timer: 500000000
    })
  }
}
