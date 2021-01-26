import "core-js/stable"
import "regenerator-runtime/runtime"
import "materialize-css/dist/js/materialize"

import "stylesheets/administration"

require("@rails/ujs").start()
require("packs/shared")

document.addEventListener('DOMContentLoaded', () => {
  let selectAll = document.getElementById('selectAll');

  selectAll.addEventListener('click', () => {
    let checkboxes = document.querySelectorAll('input[type=checkbox]');
    for (let i = 0; i < checkboxes.length; i++) {
     checkboxes[i].checked = true;
    };
  });
});
