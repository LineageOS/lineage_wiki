var storageKey = "lineage-theme";
var root = document.documentElement;

function getStoredTheme() {
  try {
    var savedTheme = localStorage.getItem(storageKey);
    if (savedTheme === "dark" || savedTheme === "light") {
      return savedTheme;
    }
  } catch (error) {
    return null;
  }
  return null;
}

function applyTheme(theme) {
  root.classList.remove("dark", "light");
  if (theme === "dark") {
    root.classList.add("dark");
  } else if (theme === "light") {
    root.classList.add("light");
  }
}

var initialTheme = getStoredTheme();
if (initialTheme) {
  applyTheme(initialTheme);
}

function saveTheme(theme) {
  try {
    if (theme === "dark" || theme === "light") {
      localStorage.setItem(storageKey, theme);
    } else {
      localStorage.removeItem(storageKey);
    }
  } catch (error) {
    // Ignore localStorage errors.
  }
}

function updateToggleState() {
  var button = document.getElementById("theme-toggle");
  if (!button) {
    return;
  }

  var isForcedDark = root.classList.contains("dark");
  var icon = button.querySelector(".theme-toggle-icon");

  if (icon) {
    icon.textContent = isForcedDark ? "dark_mode": "light_mode";
  }

  button.setAttribute(
    "aria-label",
    isForcedDark ? "Force light mode" : "Force dark mode",
  );
  button.setAttribute(
    "title",
    isForcedDark ? "Force light mode" : "Force dark mode",
  );
}

function initializeThemeToggle() {
  updateToggleState();

  var button = document.getElementById("theme-toggle");
  if (!button) {
    return;
  }

  button.addEventListener("click", function () {
    var nextTheme = root.classList.contains("dark") ? "light" : "dark";
    applyTheme(nextTheme);
    saveTheme(nextTheme);
    updateToggleState();
  });
}

if (document.readyState === "loading") {
  document.addEventListener("DOMContentLoaded", initializeThemeToggle);
} else {
  initializeThemeToggle();
}
