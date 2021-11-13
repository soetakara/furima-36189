function pulldown(){
  const priceInput = document.getElementById("item-price")
  const inputCommission = document.getElementById("add-tax-price")
  const inputProfit = document.getElementById("profit")

  priceInput.addEventListener("input" , ()=>{
    const inputValue = priceInput.value
    const commission = inputValue * 0.1
    inputCommission.innerHTML = commission
    inputProfit.innerHTML = inputValue - commission
  })
}

window.addEventListener('load', pulldown)