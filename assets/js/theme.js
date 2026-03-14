var storageKey = "lineage-theme";
var root = document.documentElement;
var colorSchemeQuery =
  typeof window !== "undefined" && window.matchMedia
    ? window.matchMedia("(prefers-color-scheme: dark)")
    : null;

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

function getSystemTheme() {
  return colorSchemeQuery && colorSchemeQuery.matches ? "dark" : "light";
}

function applyTheme(theme) {
  root.classList.remove("dark", "light");
  if (theme === "dark") {
    root.classList.add("dark");
  } else if (theme === "light") {
    root.classList.add("light");
  }
}

var initialTheme = getStoredTheme() || getSystemTheme();
applyTheme(initialTheme);

function saveTheme(theme) {
  try {
    if (theme === "dark" || theme === "light") {
      localStorage.setItem(storageKey, theme);
    } else {
      localStorage.removeItem(storageKey);
    }
  } catch (error) {}
}

function updateToggleState() {
  var button = document.getElementById("theme-toggle");
  if (!button) {
    return;
  }

  var isDark = root.classList.contains("dark");
  var icon = button.querySelector(".theme-toggle-icon");

  if (icon) {
    icon.textContent = isDark ? "dark_mode" : "light_mode";
  }

  button.setAttribute(
    "aria-label",
    isDark ? "Toggle light mode" : "Toggle dark mode",
  );
  button.setAttribute(
    "title",
    isDark ? "Toggle light mode" : "Toggle dark mode",
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

  if (!getStoredTheme() && colorSchemeQuery) {
    colorSchemeQuery.addEventListener("change", function (event) {
      applyTheme(event.matches ? "dark" : "light");
      updateToggleState();
    });
  }
}

if (document.readyState === "loading") {
  document.addEventListener("DOMContentLoaded", initializeThemeToggle);
} else {
  initializeThemeToggle();
}
