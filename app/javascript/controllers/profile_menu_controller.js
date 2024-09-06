import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["pmenu"];

  connect() {
    this.pmenuTarget.classList.add('hidden');
  }

  toggle() {
    const isExpanded = this.element.getAttribute('aria-expanded') === 'true';
    this.element.setAttribute('aria-expanded', !isExpanded);
    this.pmenuTarget.classList.toggle('hidden', isExpanded);
  }

  close(event) {
    if (!this.element.contains(event.target) && !this.pmenuTarget.contains(event.target)) {
      this.pmenuTarget.classList.add('hidden');
      this.element.setAttribute('aria-expanded', 'false');
    }
  }
}
