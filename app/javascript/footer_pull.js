function showCategory () {

  const footerCategory = document.getElementById("footer-pull-btn");
  const footerPull = document.getElementById('footer-pull-down');

  footerCategory.addEventListener('click', function () {
     if (footerPull.getAttribute("class") == "footer-pull-down") {
      footerPull.removeAttribute("class", "footer-pull-down");
     } else {
       footerPull.setAttribute("class", "footer-pull-down");
     };
  });
};
window.addEventListener("load", showCategory)
