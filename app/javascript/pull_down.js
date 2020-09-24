function setCategory () {

  const category = document.getElementById("category-bar");
  const pullDown = document.getElementById('pull-down');

  category.addEventListener('click', function () {
     if (pullDown.getAttribute("class") == "pull-down-none") {
      pullDown.removeAttribute("class", "pull-down-none");
     } else {
       pullDown.setAttribute("class", "pull-down-none");
     };
  });
};
window.addEventListener("load", setCategory)
