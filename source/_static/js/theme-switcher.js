function cycleThemeOnce() {
  const currentTheme = localStorage.getItem("theme") || "light";
  const prefersDark = window.matchMedia("(prefers-color-scheme: dark)").matches;

  if (prefersDark) {
    if (currentTheme == "light") {
      setTheme("dark");
    } else {
      setTheme("light");
    }
  } else {
    if (currentTheme == "dark") {
      setTheme("light");
    } else {
      setTheme("dark");
    }
  }
}

function setTheme(mode) {
  if (mode !== "light" && mode !== "dark") {
    console.error(`Got invalid theme mode: ${mode}. Resetting to auto.`);
    mode = "light";
  }

  document.body.dataset.theme = mode;
  localStorage.setItem("theme", mode);
  console.log(`Changed to ${mode} mode.`);
}

function setupTheme() {
  // Attach event handlers for toggling themes
  const buttons = document.getElementsByClassName("theme-toggle");
  Array.from(buttons).forEach((btn) => {
    btnClone = btn.cloneNode(true);
    btn.parentNode.replaceChild(btnClone, btn);

    btnClone.addEventListener("click", cycleThemeOnce);
  });
}

setTimeout(() => {
  setupTheme();
}, 100);
