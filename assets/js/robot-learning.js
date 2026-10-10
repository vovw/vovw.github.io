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
            if (video.hasAttribute('data-gallery-loop')) return;
            if (other !== video && !other.hasAttribute('data-gallery-loop')) other.pause();
        });
    });
});

// GIF-like gallery loops use small MP4s and run only while visible.
const galleryLoops = document.querySelectorAll('video[data-gallery-loop]');
const allowGalleryMotion = !window.matchMedia('(prefers-reduced-motion: reduce)').matches && !navigator.connection?.saveData;
if (allowGalleryMotion && 'IntersectionObserver' in window) {
    const loopObserver = new IntersectionObserver((entries) => {
        entries.forEach(({ target, isIntersecting }) => {
            target.dataset.inView = String(isIntersecting);
            if (isIntersecting && !document.hidden) {
                loadPoster(target);
                target.play().catch(() => {});
            } else {
                target.pause();
            }
        });
    }, { threshold: 0.5 });
    galleryLoops.forEach((video) => loopObserver.observe(video));
    document.addEventListener('visibilitychange', () => {
        galleryLoops.forEach((video) => {
            if (document.hidden) video.pause();
            else if (video.dataset.inView === 'true') video.play().catch(() => {});
        });
    });
}
