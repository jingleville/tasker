import { Controller } from "@hotwired/stimulus"
import { patch } from "@rails/request.js"
import Sortable from "sortablejs";

// Connects to data-controller="sortable"
export default class extends Controller {
  connect() {
    console.log(this.element);
    this.sortable = new Sortable(this.element, {
      group: this.element.id,
    });
  }
}
