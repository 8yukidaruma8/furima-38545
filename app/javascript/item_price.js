function sele (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue / 10);
    const tax = addTaxDom.innerHTML
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue - tax);
  });
};
window.addEventListener('load',sele);