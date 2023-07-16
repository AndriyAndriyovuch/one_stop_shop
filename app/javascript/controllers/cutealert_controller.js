import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cutealert"
export default class extends Controller {
  static values = {
    url: String,
    product: String
  }

  connect() {
  }

  successToast() {
    cuteToast({
      type: 'success',
      title: "Great",
      message: "Product was successfully added",
      timer: 2000
    })
  }

  alertToast() {
    cuteToast({
      type: 'warning',
      title: "",
      message: "Product was successfully removed =(",
      timer: 2000
    });

    const productContainer = document.getElementById(this.productValue)
    productContainer.remove()

    const productsCount = document.getElementById("products-count")
    productsCount.textContent = Number(productsCount.textContent) - 1

    const productSum = document.getElementById(`${String(this.productValue)}-sum`)
    const totalSum = document.getElementById("total-sum")

    console.log(productSum)
    console.log(totalSum)

    totalSum.textContent = `₴ ${Number(totalSum.textContent.slice(2)) - Number(productSum.textContent.slice(2))}`

    const csrfToken = document.querySelector("[name='csrf-token']").content

    fetch(this.urlValue, {
      method: "POST",

      headers: {
        'X-CSRF-Token': csrfToken
      },
    })
  }
}
