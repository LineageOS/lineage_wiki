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
  if (theme === "dark") {
    root.classList.add("dark");
  } else if (theme === "light") {
    root.classList.remove("dark");
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
  var label = document.getElementsByClassName("navbar-appearance-label");

  if (icon) {
    icon.textContent = isDark ? "light_mode": "dark_mode";
  }

  if (label && label[0]) {
    label[0].innerHTML = isDark ? "Use light theme" : "Use dark theme";
  }

  button.setAttribute(
    "aria-label",
    isDark ? "Use light theme" : "Use dark theme",
  );
  button.setAttribute("title", isDark ? "Use light theme" : "Use dark theme");
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
