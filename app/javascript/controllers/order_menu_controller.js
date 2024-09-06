import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["omenu","ochevron"];

  connect() {
    this.omenuTarget.classList.add('hidden');
  }

  toggle() {
    const isExpanded = this.element.getAttribute('aria-expanded') === 'true';
    this.element.setAttribute('aria-expanded', !isExpanded);
    this.omenuTarget.classList.toggle('hidden', isExpanded);
    this.ochevronTarget.classList.toggle('rotate-90', isExpanded);
  }

  close(event) {
    if (!this.element.contains(event.target) && !this.omenuTarget.contains(event.target)) {
      this.omenuTarget.classList.add('hidden');
      this.element.setAttribute('aria-expanded', 'false');
      this.ochevronTarget.classList.remove('rotate-90');
    }
  }
}
