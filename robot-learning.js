// Keep the page quiet: starting a demo pauses any other demo that's playing.
// Native controls and source links still work when JavaScript is disabled.
document.querySelectorAll('video').forEach((video) => {
    video.addEventListener('play', () => {
        document.querySelectorAll('video').forEach((other) => {
            if (other !== video) other.pause();
        });
    });
});
