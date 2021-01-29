import "core-js/stable"
import "regenerator-runtime/runtime"
import "materialize-css/dist/js/materialize"

import "stylesheets/administration"

require("@rails/ujs").start()
require("packs/shared")

document.addEventListener('DOMContentLoaded', () => {
  let menuDropdown = document.querySelectorAll('.menu-dropdown');
  let dropdownOptions = {
    'closeOnClick': true,
    'hover': true };
  M.Dropdown.init(menuDropdown, dropdownOptions);

  let selectAll = document.getElementById('select-all');
  if (selectAll) {
    selectAll.addEventListener('click', () => {
      let checkboxes = document.querySelectorAll('input[type=checkbox]');

      checkboxes.forEach( (checkbox) => {
        checkbox.checked = true;
      });
    });
  };
});
