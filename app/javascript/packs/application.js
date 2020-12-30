import "core-js/stable"
import "regenerator-runtime/runtime"
import "materialize-css/dist/js/materialize"

import "stylesheets/application"

const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

require("@rails/ujs").start()

document.addEventListener('DOMContentLoaded', () => {
  M.AutoInit();

  var elems = document.querySelectorAll('.sidenav');
  var instances = M.Sidenav.init(elems, options);
});
