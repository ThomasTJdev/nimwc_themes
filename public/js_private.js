const $btnApply = document.querySelectorAll("button.apply");
const $btnUpdate = document.querySelectorAll("button.update");
const $btnDelete = document.querySelectorAll("button.delete");
if ($btnApply.length) {
  $btnApply.forEach( el => {
    el.addEventListener('click', function(event) {
      var result = confirm("This will overwrite style_custom.js Remember to save your changes before applying a new stylesheet. Apply?");
      if (result) {
        window.location.href = event.srcElement.getAttribute("data-url");
      }
    });
  });
}
if ($btnUpdate.length) {
  $btnUpdate.forEach( el => {
    el.addEventListener('click', function(event) {
      var result = confirm("This will update the stylesheet. Are you sure?");
      if (result) {
        window.location.href = event.srcElement.getAttribute("data-url");
      }
    });
  });
}
if ($btnDelete.length) {
  $btnDelete.forEach( el => {
    el.addEventListener('click', function(event) {
      var result = confirm("This will delete the stylesheet. Are you sure?");
      if (result) {
        window.location.href = event.srcElement.getAttribute("data-url");
      }
    });
  });
}