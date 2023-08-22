import { Controller } from "@hotwired/stimulus"
import { post } from "@rails/request.js"

// Connects to data-controller="groups"
export default class extends Controller {
  static targets = [ "archieved", "procedure"]

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

  getProcedure(e) {
    var e_id = e.target.id.split("-");
    var group_id = e_id[0];
    var procedure_id = e_id[1];
    if (group_id && procedure_id) {
      var target_url = '/groups/'+group_id+'/procedures/'+procedure_id
    location.href = target_url
    }
  };

  destroyProcedure(e) {
    var deleting_group_element = this.procedureTargets[Number(e.target.id)]
    var group_id = deleting_group_element.id.split("-")[0]
    var procedure_id = deleting_group_element.id.split("-")[1]
    var updating_group_element = this.procedureTargets.slice(Number(e.target.id) + 1)

    console.log(updating_group_element)

    const groupAnimation = [
      { 'margin-left': "-90px"  },
    ];

    const groupTiming = {
      duration: 2000,
      iterations: 1,
    };


    deleting_group_element.remove();
    updating_group_element.animate(groupAnimation, groupTiming);

  }; 
}


