import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="group"
export default class extends Controller {

  
  init() {
    console.log("init")
  }

  connect() {
    console.log("connected")
    console.log(this.element)
  }

  getProcedure(e) {
    var e_id = e.target.id;
    var group_id = e_id.split("-")[0];
    var procedure_id = e_id.split("-")[1];
    if (group_id && procedure_id) {
      var target_url = '/groups/'+group_id+'/procedures/'+procedure_id
    location.href = target_url
    }
  

  }
}
