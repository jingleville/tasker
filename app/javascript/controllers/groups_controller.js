import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="groups"
export default class extends Controller {
  static targets = [ "archieved"]

  init() {
    console.log("init")
  }

  connect() {
    console.log("connected")
    console.log(this.element)
  }

  showArchieved() {
    var elements = this.archievedTargets;
    elements.forEach(function (item) {
      if (item.style.display === 'none') {
        item.style.display = 'block'  
      } else {
        item.style.display = 'none'  
      }
    });
    };
}


// const fruits = ["apple", "orange", "cherry", "cherry"];
// fruits.forEach(function myFunction(item, index) {
//   text += index + ": " + item + "<br>"; 
// });