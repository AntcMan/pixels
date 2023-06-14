import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-modal"
export default class extends Controller {
  connect() {
    console.log("ImageModal controller connected");
    this.element.addEventListener('click', this.showModal)
  }

  showModal(e) {
    e.preventDefault();
    const imageUrl = e.target.getAttribute();

  }
}
