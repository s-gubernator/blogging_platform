const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

document.addEventListener('DOMContentLoaded', () => {
  let noticeEl = document.querySelector('#notice');

  M.AutoInit();

  if (noticeEl) {  M.toast( { html: noticeEl.dataset.notice, displayLength: 5000 })}
});
