import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "img"]

  connect() {
    this.update()
  }

  update() {
    const lang = (this.inputTarget.value || "").trim().toLowerCase()

    if (lang.length === 0) {
      this.imgTarget.style.display = "none"
      return
    }

    const code = (lang === "en") ? "gb" : lang

    this.imgTarget.src = `https://flagcdn.com/w40/${code}.png`
    this.imgTarget.alt = code
    this.imgTarget.style.display = "inline-block"
  }
}
