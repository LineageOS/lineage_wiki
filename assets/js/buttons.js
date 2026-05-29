const prefersReducedMotion =
  typeof window !== "undefined" && window.matchMedia
    ? window.matchMedia("(prefers-reduced-motion: reduce)")
    : null;

function spawnRipple(target, event) {
  if (prefersReducedMotion && prefersReducedMotion.matches) {
    return;
  }

  target.querySelectorAll('.ripple-effect').forEach(function (r) {
    r.remove();
  });

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
  target.appendChild(ripple);

  // Remove after timeout if original element was hidden
  const cssSpeed = window.getComputedStyle(document.documentElement).getPropertyValue('--transition-speed') || '0.6s';
  const durationMs = (parseFloat(cssSpeed) * (cssSpeed.endsWith('ms') ? 1 : 1000)) || 600;

  setTimeout(function () {
    ripple.remove();
  }, durationMs + 50);
}

document.addEventListener("pointerdown", function (event) {
  if (!event.target.closest) {
    return;
  }

  const rippleTarget = event.target.closest('.nav-link, .popup-close-action');
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
