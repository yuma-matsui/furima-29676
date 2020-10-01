function setCategory () {

  const category = document.getElementById("category-bar");
  const pullDown = document.getElementById('pull-down');

  category.addEventListener('mouseover', function () {
      pullDown.removeAttribute("class", "pull-down-none");
  });

  pullDown.addEventListener('mouseleave', function () {
    pullDown.setAttribute("class", "pull-down-none");
  });
};
window.addEventListener("load", setCategory);


