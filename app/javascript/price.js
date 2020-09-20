if (location.pathname.match( "items/new" ) || location.pathname.match( "items/\/(\d+)$/edit" )) {
function priceChange() {
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  price.addEventListener("input", () => {
    const value = price.value;
    tax.innerText = value / 10
    profit.innerHTML = value - (value / 10)
  })
};
setInterval(priceChange, 1000);
}