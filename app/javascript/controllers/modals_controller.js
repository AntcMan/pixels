import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modals"
export default class extends Controller {
  connect() {
    console.log("Modals controller connected!")

  }

  close(e) {
  // PREVENT DEFAULT ACTION OF RELOADING PAGE
  e.preventDefault();

  const modal = document.getElementById("modal");
  modal.innerHTML = "";
  }
}