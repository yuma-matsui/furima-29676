function setMenu () {

  const userMenu = document.getElementById("menu-icon");
  const menuLists = document.getElementById('lists-right');

  userMenu.addEventListener('click', function () {
     if (menuLists.getAttribute("class") == "lists-right-none") {
      menuLists.removeAttribute("class", "lists-right-none");
     } else {
       menuLists.setAttribute("class", "lists-right-none");
     };
  });
};
window.addEventListener("load", setMenu);