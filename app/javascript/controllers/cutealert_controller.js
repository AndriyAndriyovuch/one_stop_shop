import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cutealert"
export default class extends Controller {
  static values = {
    url: String,
    product: String,
  }

  connect() {
  }

  successToast() {
    cuteToast({
      type: 'success',
      title: "Great",
      message: "Product was successfully added",
      timer: 2000
    });

    localStorage.setItem(`${this.productValue}`, "1");

    const productsCount = document.getElementById("products-count")

    productsCount.innerHTML = `${localStorage.length}`
  }

  alertToast() {
    cuteToast({
      type: 'warning',
      title: "",
      message: "Product was successfully removed =(",
      timer: 2000
    });

    const productContainer = document.getElementById(this.productValue)
    const productSum = document.getElementById(`${this.productValue}-sum`)
    const totalSum = document.getElementById("total-sum")
    const productsCount = document.getElementById("products-count")

    productContainer.remove()

    productsCount.textContent = Number(productsCount.textContent) - 1

    totalSum.textContent = `₴ ${(Number(totalSum.textContent.slice(2)) - Number(productSum.textContent.slice(2))).toFixed(2)}`

    const csrfToken = document.querySelector("[name='csrf-token']").content

    fetch(this.urlValue, {
      method: "POST",
      headers: {
        'X-CSRF-Token': csrfToken
      },
    })

    localStorage.removeItem(`${this.productValue}`)
  }
}
