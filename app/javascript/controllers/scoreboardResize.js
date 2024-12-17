// app/javascript/controllers/scoreboardResize.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["leadingYear", "leadingForm"];
  connect() {
    const footer = this.element;
    const leadingLen = footer.textContent.length;

    console.log('Ran');

    if (!footer) {
      console.error("Error: Required elements 'footer' not found.");
      return;
    }

    // Adjust font size based on the total length
    let fontSize;
    if (leadingLen < 45) {
      fontSize = '4vw';
    } else if (leadingLen <= 62) {
      fontSize = '3vw';
    } else {
      fontSize = '2vw';
    }

    // Apply the calculated font size
    footer.style.fontSize = fontSize;
    footer.style.fontSize = fontSize;
  }
}