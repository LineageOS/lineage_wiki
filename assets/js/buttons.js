document.addEventListener("pointerdown", function (event) {
  const button =
    event.target.closest && event.target.closest(".btn.btn-primary");
  if (button) {
    button.classList.add("btn-pressing");
  }
});

function releasePressedButtons() {
  const buttons = document.querySelectorAll(".btn.btn-primary.btn-pressing");
  for (const b of buttons) {
    b.classList.remove("btn-pressing");
  }
}

document.addEventListener("pointerup", releasePressedButtons);
document.addEventListener("pointercancel", releasePressedButtons);
