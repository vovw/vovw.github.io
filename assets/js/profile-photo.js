(() => {
    const photos = ['main.webp', 'bridge.webp', 'fishing.webp'];
    const key = 'atharva-profile-photo';
    const base = new URL('../media/profile/', document.currentScript.src);
    let selected;
    try {
        selected = sessionStorage.getItem(key);
    } catch (_) { /* Photos still rotate when browser storage is unavailable. */ }

    const reload = performance.getEntriesByType('navigation')[0]?.type === 'reload';
    if (!photos.includes(selected) || reload) {
        const choices = photos.filter((photo) => photo !== selected);
        selected = choices[Math.floor(Math.random() * choices.length)];
        try {
            sessionStorage.setItem(key, selected);
        } catch (_) { /* Keep the selected photo for this page. */ }
    }

    document.querySelectorAll('.profile-img').forEach((photo) => {
        photo.src = new URL(selected, base).href;
        photo.width = 400;
        photo.height = 533;
    });
})();
