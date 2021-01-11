import "core-js/stable"
import "regenerator-runtime/runtime"
import "materialize-css/dist/js/materialize"

import "stylesheets/administration"

require("@rails/ujs").start()

document.addEventListener('DOMContentLoaded', () => {
  M.AutoInit();
});

// document.addEventListener('DOMContentLoaded', () => {
//   M.toast( { html: 'Test content', displayLength: 4000 } );
// })
