import "core-js/stable"
import "regenerator-runtime/runtime"
import "materialize-css/dist/js/materialize"

import "stylesheets/administration"

require("@rails/ujs").start()

document.addEventListener('DOMContentLoaded', () => {
  M.AutoInit();
});

document.addEventListener('DOMContentLoaded', () => {
  let noticeEl = document.querySelector('#notice');

  if (noticeEl) {  M.toast( { html: noticeEl.dataset.notice, displayLength: 5000 })}
})
