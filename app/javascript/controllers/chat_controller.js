import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["messages"]

  connect() {
    this.scrollToBottom()

    // 🔥 Observe DOM changes INSIDE messages
    this.observer = new MutationObserver(() => {
      this.scrollToBottom()
    })

    this.observer.observe(this.element, {
      childList: true,
      subtree: true
    })
  }

  disconnect() {
    if (this.observer) this.observer.disconnect()
  }

  scrollToBottom() {
    this.element.scrollTop = this.element.scrollHeight
  }
}
