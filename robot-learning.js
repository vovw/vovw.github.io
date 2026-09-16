const videos = document.querySelectorAll('video');

// Preview images load near the viewport; video data waits for playback.
const loadPoster = (video) => {
    if (!video.dataset.poster) return;
    video.poster = video.dataset.poster;
    delete video.dataset.poster;
};

if ('IntersectionObserver' in window) {
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(({ target, isIntersecting }) => {
            if (!isIntersecting) return;
            loadPoster(target);
            observer.unobserve(target);
        });
    }, { rootMargin: '300px' });
    videos.forEach((video) => {
        if (video.dataset.poster) observer.observe(video);
    });
} else {
    videos.forEach(loadPoster);
}

// Native controls still work without JavaScript. Play one demo at a time.
videos.forEach((video) => {
    video.addEventListener('play', () => {
        videos.forEach((other) => {
            if (other !== video) other.pause();
        });
    });
});
