import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["cmenu", "cchevron"];

  connect() {
    this.cmenuTarget.classList.add('hidden');
  }

  toggle() {
    const isExpanded = this.element.getAttribute('aria-expanded') === 'true';
    this.element.setAttribute('aria-expanded', !isExpanded);
    this.cmenuTarget.classList.toggle('hidden', isExpanded);
    this.cchevronTarget.classList.toggle('rotate-90', isExpanded);
  }

  close(event) {
    if (!this.element.contains(event.target) && !this.cmenuTarget.contains(event.target)) {
      this.cmenuTarget.classList.add('hidden');
      this.element.setAttribute('aria-expanded', 'false');
      this.cchevronTarget.classList.remove('rotate-90');
    }
  }
}
