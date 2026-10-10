# Updating ksagar.site

This is a static HTML/CSS site. No framework, package install, or build is needed.

All paths in this guide and derivative paths in `data/media/*.json` are relative to the repository root. The page URLs, HTML layout, stylesheet contents, and media bytes are unchanged by the file reorganization. See `README` for the directory map.

## Work page

`/work/` is the visual portfolio linked from About and Craft. Edit `work/index.html` for the EMG, Wall-E, and robot learning galleries; its layout lives in `assets/css/work.css`. The robot learning gallery reuses the media in `assets/media/robotics/` and links to the detailed `/robotics/` worklog. New local media derivatives and their source hashes are recorded in `data/media/work.json`. Keep captions short and distinguish hardware, simulation, and manual tests.

## Preview

From the repository root:

```sh
python3 -m http.server 8000 --bind 127.0.0.1
```

Open `http://127.0.0.1:8000/robotics/`. The `/robotics` directory route redirects to `/robotics/` on the static server. The previous draft address, `/robot-learning.html`, forwards to it. Refresh the browser after edits.

## Writing

- Edit `robotics/index.html` directly. Each experiment is a `<section>` with an anchor, paragraphs, figures and source links. Duplicate a nearby `<figure>` to add a clip.
- The shared serif typography remains in `assets/css/style.css`. Layout specific to the narrative lives in `assets/css/robot-learning.css`.
- About is `index.html`. Craft retains its published Google Doc for now. Research is deferred at Atharva's request.
- Keep a demo's explanation and caption together. Name the method and collaborators. Distinguish physical hardware, simulation, human-operated tests and autonomous policies; label speedups or say the source speed is unspecified.
- A successful clip is not a measured success rate. Include evaluation counts and conditions with numerical claims. Reproductions should link and credit the original paper.

## Media

Media lives in `assets/media/`, grouped by project: `emg/`, `walle/`, `mario/`, `robotics/`, `lab/`, and `research/`. Portraits live in `assets/media/profile/`, with the original JPGs preserved in `originals/`. Video/poster pairs stay together in the same project directory. The worklog is unlinked from About and Craft and uses `noindex`; `/robotics/` is still publicly accessible by direct link.

The separate archive is `/home/sra/ksagar/ksagar-site-originals-2026-09-14`. It is outside the served site and this Git repository. The downloaded X clips are platform renditions, not camera-master files. Existing original personal photos retain their exact bytes.

`data/media/robotics.json` records source links, original filenames and hashes, control modes, timing and derived filenames. `data/media/sra.json` records the images reused from the Google Doc. The page currently uses three of those six prepared images; the others are available for the next Craft pass.

Seven selected X images are scattered through the robotics page in `.snapshot` figures and `.photo-notes` pairs. Duplicate either pattern to add another; the placement is static and needs no JavaScript. `data/media/twitter.json` records their dates, source posts, exact downloaded rendition URLs, credits, dimensions and original hashes. Source files are preserved in the archive's `twitter-images/` directory. The full-frame WebP derivatives total about 548 KB, use lazy loading, and link back to the original posts. No research imagery has been generated, retouched or cropped.

To prepare a new clip, add its provenance to the manifest and place its original in the separate archive. Then run:

```sh
python3 tools/prepare_media.py /home/sra/ksagar/ksagar-site-originals-2026-09-14
```

The optional helper needs ffmpeg/ffprobe. It preserves the full clip's timing and audio while making H.264/AAC MP4 and WebP poster derivatives. It skips existing outputs. For a new encode, use a new derivative filename rather than replacing an original. Set the HTML width/height to the dimensions written to the manifest. Videos use `preload="none"` to defer downloads until playback. The opening poster loads immediately; other posters use `data-poster` and load within 300 px of the viewport. Project photos use native lazy loading and asynchronous decoding. Without JavaScript, native video controls and original-demo links still work. Starting one local clip pauses the others.

The 15 clips total about 28.5 MB. Only the selected clip downloads when played. This is small enough to keep the derivatives with this static site for now. Reassess external storage if the collection grows; nothing has been uploaded or purchased. Wall-E's longer project video opens its original YouTube page: official embeds returned a blank player in this preview environment.

## Sources and checks

`docs/audits/refresh-inventory.md` records source context and attribution. `docs/audits/image-audit.md` is the second-pass image shortlist, with useful omissions, suggested placements and corrections for the rewrite. `data/inventories/video-inventory.csv` has all 60 reviewed video-post links; `data/inventories/photo-inventory.csv` has 97 curated image/research/Craft entries; `data/inventories/photo-grid-index.csv` records the complete 602-photo-link scan and which 91 posts received an individual context review. The first pass's 607 links included five mixed-media video links. An unverified lead is not ready-made page copy.

Run `python3 tools/check_site.py` to validate local HTML links, asset paths, anchors, and manifest derivatives. After editing, check the navigation and section links, start changed videos, and inspect a narrow phone layout. Before any future publication, review the final writing and media with Atharva. This refresh has not been committed, pushed or deployed.
