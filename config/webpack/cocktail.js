const add_form = document.querySelector(".form-row")
document.querySelector("#add-ingredient").addEventListener("click", (event) => {
  event.preventDefault();
  document.querySelector(".form-dose").insertAdjacentElement("beforeend", add_form)
})
