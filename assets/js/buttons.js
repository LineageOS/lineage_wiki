const prefersReducedMotion =
  typeof window !== "undefined" && window.matchMedia
    ? window.matchMedia("(prefers-reduced-motion: reduce)")
    : null;

function spawnRipple(target, event) {
  if (prefersReducedMotion && prefersReducedMotion.matches) {
    return;
  }

  const rect = target.getBoundingClientRect();
  const x = event.clientX - rect.left;
  const y = event.clientY - rect.top;
  const radius = Math.max(
    Math.hypot(x, y),
    Math.hypot(rect.width - x, y),
    Math.hypot(x, rect.height - y),
    Math.hypot(rect.width - x, rect.height - y),
  );

  const ripple = document.createElement("span");
  ripple.className = "ripple-effect";
  ripple.style.width = ripple.style.height = radius * 2 + "px";
  ripple.style.left = x - radius + "px";
  ripple.style.top = y - radius + "px";
  ripple.addEventListener("animationend", function () {
    ripple.remove();
  });

  target.appendChild(ripple);
}

document.addEventListener("pointerdown", function (event) {
  if (!event.target.closest) {
    return;
  }

  const rippleTarget = event.target.closest('.nav-link');
  if (rippleTarget) {
    spawnRipple(rippleTarget, event);
  }

  const button = event.target.closest(".btn.btn-primary");
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
