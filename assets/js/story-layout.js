// Let nearby paragraphs share the space beside taller demos on desktop.
// Restore the original paragraph/demo order when the layout stacks on mobile.
const storyDesktop = window.matchMedia('(min-width: 1024px)');
const storyRuns = [...document.querySelectorAll('.story-run')].map((run) => {
    const media = [...run.querySelectorAll('.story-media')].map((item) => {
        const marker = document.createComment('inline demo position');
        item.before(marker);
        if (item.closest('.story-row-short')) item.classList.add('media-short');
        return { item, marker };
    });
    return { run, media, column: run.querySelector('.story-run-media') };
});

const arrangeStory = () => {
    storyRuns.forEach(({ run, media, column }) => {
        run.classList.toggle('is-column-layout', storyDesktop.matches);
        media.forEach(({ item, marker }) => {
            if (storyDesktop.matches) column.append(item);
            else marker.after(item);
        });
    });
};
arrangeStory();
storyDesktop.addEventListener('change', arrangeStory);
