# Website refresh: source inventory and editorial notes

Reviewed 14 September 2026. Working notes, not public page copy.

## Scope and working tree

- Existing `robot-learning-refresh` branch. Initial working tree was clean. No commits, pushes, deployments, hosting purchases or uploads.
- Original site read before the reference site. Plain HTML/CSS, Utopia serif, orange accents, blue inline links. Existing personal details, photos, contact links, Japanese encouragement and SRA webring preserved.
- User approved implementation, requested the early sim-to-real demos as the start, then explicitly deferred Research and asked to finish Robot Learning first.
- This pass adds Robot Learning, an About entry into it, and navigation from Craft. Craft's existing editable Google Doc remains in place. Research remains untouched for a later pass.
- About's existing age 21 / Mumbai statements are preserved, not freshly verified.

## Browser coverage and actual limits

Initially X required login. After the user signed in, reviewed both the Videos feed and Photos grid with the browser integration. Repeated scrolling at the bottom stopped producing older entries in both feeds.

- **60 unique video posts**, 23 August 2023 through 13 September 2026. All visible post text scanned; selected demos played and key posts opened individually with visible quoted posts and replies.
- **607 unique media-grid links** in the first pass: the second audit resolves these into **602 photo links and five mixed-media video links**. Newest photo entry 12 September 2026; oldest photo `1481648861781569536`, now opened and confirmed as a Linux-desktop post dated 13 January 2022.
- Profile header showed 725 photos/videos. This is not a count of unique posts and does not equal the counts above. Photos and videos can share posts; quoted media can also appear.
- Some thumbnails failed to render in the first pass. The second image audit re-scrolled the full grid and visually reviewed all 602 loaded previews; 91 selected posts were opened individually, and all 26 pictures in 10 relevant multi-image posts were inspected. **Not every personal/meme post or every attachment across all 602 posts was opened.** This is the bottom the UI exposed, not a claim that deleted, unavailable or hidden posts were recovered. See `image-audit.md` and `photo-grid-index.csv` for exact coverage and corrections.
- Opened at least 22 relevant individual main posts, plus quoted posts/replies and the Craft source links. No likes, replies, reposts, follows or other social interactions.
- `video-inventory.csv` retains all 60 video-post source links. Timestamps are normalized to UTC using the public post ID; dates were also checked against visible timestamps for the selected posts. Public page dates are calendar dates of the original posts; the August 6 pair explicitly uses IST.

## Story and structure now implemented

0. Wall-E / SRA-VJTI chapter added at the user’s request before the dated sim-to-real section, with team contributions, kit/team photos, Mario teaching and the linked Wall-E video.
1. Opening: August 7, 2025 RL cube pickup on real hardware.
2. Early sim-to-real: July attempt, August 6 failure and progress, learning method and dependency credits.
3. Demonstrations: behavioral cloning; human-video hand reconstruction with HaMeR / Egocentric-10K attribution.
4. Pretrained policies: MolmoAct 2 deployment, limitations and the robodal inference experiment.
5. Dense features: Patch Policy reproduction, simulation and hardware side by side, reported metrics and remaining gaps.
6. Longer tasks: collaborative physical Atari, π0.5 folding and a later folding failure.
7. Current questions: human-operated UMI-style interface, learning from human video, online improvement and recovery.

The questions and transitions are draft editorial synthesis from the experiments, for Atharva to review. They do not assert unverified experiments or results.

## Featured clip evidence

See `robotics/media/manifest.json` for source IDs, original filenames, captions, dimensions, durations, bytes and hashes. All 13 clips are local compressed MP4 derivatives with WebP posters. Selected originals are **X's downloadable renditions, not camera masters**.

| Date | Demo / source | Verified interpretation and limits |
| --- | --- | --- |
| 2025-07-31 | [Early sim-to-real](https://x.com/k7agar/status/1950788162814664765) | Visually real arm. Author replies: [PPO, FPO in progress](https://x.com/k7agar/status/1950794100594364474), [vision](https://x.com/k7agar/status/1951306235522810212). Speed unspecified. |
| 2025-08-06 | [Attempt](https://x.com/k7agar/status/1953104167482085578) | Physical pickup attempt; author explicitly says [pure sim-to-real RL](https://x.com/k7agar/status/1953123633909383574). No success-rate evidence. |
| 2025-08-06 | [Progress](https://x.com/k7agar/status/1953121197300044173) | Own new clip plus quoted failed clip. Correct first video selected by asset ID. No invented mechanism for improvement. |
| 2025-08-07 | [Cube pickup](https://x.com/k7agar/status/1953470993558900803) | Visible real pickup; author [confirms RL rather than imitation](https://x.com/k7agar/status/1953480808666181860). [Stone Tao credit](https://x.com/k7agar/status/1953472428983869518). Better PPO/FPO and SOTA remarks are plans, not results. |
| 2025-11-08 | [Behavioral cloning](https://x.com/k7agar/status/1987224223392411954) | Physical policy rollout. [Prime Intellect compute credit](https://x.com/k7agar/status/1987513647137173886). Exact dataset/training config not verified. |
| 2025-11-15 | [Hand reconstruction](https://x.com/k7agar/status/1989731085501304998) | HaMeR on Egocentric-10K by Eddy Xu / Build AI. Human footage with overlay; no robot execution. Contact/trajectory extraction was next work, not demonstrated here. |
| 2026-05-08 | [MolmoAct 2](https://x.com/k7agar/status/2052546425620406743) | Own hardware deployment of Ai2's model; main post explicitly 2×. [4090 / buggy inference](https://x.com/k7agar/status/2052548305427767571), [dexterity limitations](https://x.com/k7agar/status/2052546724921815167). Ai2's quoted demo is excluded from the site. |
| 2026-07-24 | [Patch Policy / Push-T](https://x.com/k7agar/status/2080551476041228335) | Own simulation reproduction. Source paper's quoted cable-insertion demo excluded. Speed unspecified. |
| 2026-07-26 | [Patch Policy / hardware](https://x.com/k7agar/status/2081313497741447559) | Own physical rollout; M3 Pro. This X clip's speed is unspecified; the separate repository GIF is labeled 2× and must not silently supply a speed label for this clip. |
| 2026-08-07 | [Physical Atari](https://x.com/k7agar/status/2085576138961907900) | External camera feeds pixels; STS3215 servos actuate joystick, author says RL adapts to lag. [Setup reply](https://x.com/k7agar/status/2085580125148704777). [Credits](https://x.com/k7agar/status/2085580487280779459): @4rynv, @sahilsapage, @LakshyaLalwani7. “Better than me” is informal, not a benchmark. |
| 2026-09-01 | [π0.5 folding](https://x.com/k7agar/status/2094818716433465631) | Physical Intelligence model; unseen environment and [4×](https://x.com/k7agar/status/2094820542641770646). Reply claims [80% SR](https://x.com/k7agar/status/2094833177277981066), but denominator/protocol unverified, so omitted from page. |
| 2026-09-06 | [Folding failure](https://x.com/k7agar/status/2096601215652249753) | Physical arms, initial fold then disruption. Same-day Astra experiment context; label conservatively model-directed. [Head and wrist views](https://x.com/k7agar/status/2096662176710955370). Speed question unanswered. |
| 2026-09-12 | [UMI interface](https://x.com/k7agar/status/2098782572247703814) | Visible human-operated interface test. [Design inspiration](https://x.com/k7agar/status/2098783385355444667): YosubShin/yam-umi. No autonomous learning result inferred. |

## Quantitative results and attribution

[Patch Policy](https://arxiv.org/abs/2607.18236), submitted July 20, 2026: Gaoyue Zhou, Zichen Jeff Cui, Ada Langford, Bowen Tan, Yann LeCun, Lerrel Pinto. Atharva is not an author. His [repository](https://github.com/vovw/patchpol) is a reproduction. Reported 100-rollout results at 50k steps with EMA: final coverage 0.772 ± 0.032, maximum 0.821 ± 0.028, success 52% using coverage >0.95. Paper target 0.83 final coverage. Preserve ± without assigning an unverified statistical meaning. No independent rerun performed. Terminal drift and idle frames are documented problems; proposed remedies are not completed outcomes. X says about 10 samples; later repo says 16 teleoperated episodes. Do not conflate those snapshots.

[robodal](https://github.com/vovw/robodal) reports 30-call latency benchmark with 5 warmups: local 45.6 ms, TCP 294.5 ms, WebSocket 374.1 ms, HTTP 493.3 ms. ALOHA simulation success evaluations have only 5–10 episodes. QUIC-over-TCP is TBD, not a demonstrated win. README has inconsistent GPU-overhead breakdowns between its summary and raw output; page uses only matching total latency figures and does not reproduce claims of identical GPU time or physical latency tolerance.

[September 4 CoRL post](https://x.com/k7agar/status/2095930757466472778) shows an Accept recommendation/decision image but no paper title, authors or identifier. Authored-paper details requested; user explicitly deferred Research. Do not list a paper from this image alone.

## Reference design study

Read [Yassine's homepage](https://yassineyousfi.github.io/) and full [World Models for Self-Driving Cars page](https://yassineyousfi.github.io/pages/comma.ai.html), with visual inspection of the opening.

Adapt the editorial pattern: captioned opening demo → motivating problem → method explained with contextual links → adjacent results/plots → practical lessons and follow-on work. Preserve attribution to source papers and team work. Keep personality in short asides. Do not copy the author's claims, driving results, or prose.


## Additional Craft leads (dates not yet verified)

- [Wall-E](https://github.com/sra-vjti/wall-e), [video](https://www.youtube.com/watch?v=AkP-XUwkO90): current Craft copy says the team manufactured, tested and sold kits for 300+ students. Preserve team framing; verify role and date.
- [Mario](https://github.com/sra-vjti/mario): current Craft copy says taught manipulation to 100+ students; open source design/code. Verify role and dates.
- [EMG band](https://github.com/vovw/emgband): hand-motion prediction project. Existing copy calls EMG a brain signal; correct to muscle electrical activity when editing.
- [V-JEPA writing](https://ksagar.bearblog.dev/vjepa/): preserve informal commentary.
- [Distilling robot learning](https://vruga.site/wonder-robotics-three-things.html): externally authored reference; read and determine relationship before attribution.
- Turtle-inspired marine observatory: existing Craft claim; establish whether identical to Kurma and credit team correctly.


## Complete video-post index

The CSV is the editable inventory; uncertain entries remain leads rather than public claims.

| Date (UTC) | Source / item | Classification |
| --- | --- | --- |
| 2023-08-23 | [ISRO launch celebration](https://x.com/k7agar/status/1694328815613305250) | Other; shared event, not own robotics work |
| 2023-09-20 | [Physics-engine experiment](https://x.com/k7agar/status/1704461066464338334) | Craft software |
| 2024-01-16 | [Cursor experiment](https://x.com/k7agar/status/1747305316570562780) | Craft software |
| 2024-02-07 | [Early robot trouble](https://x.com/k7agar/status/1755308009318666399) | Hardware; controller unverified |
| 2024-02-08 | [Line-following turns](https://x.com/k7agar/status/1755467094622396792) | Line following; distinguishes self-balancing difficulty |
| 2024-02-15 | [Short personal clip](https://x.com/k7agar/status/1758205267605323988) | Context unverified |
| 2024-03-26 | [Keyboard build](https://x.com/k7agar/status/1772555073001853432) | Craft hardware |
| 2024-06-18 | [Collaborative text editor](https://x.com/k7agar/status/1803103406321459379) | With Chinmay Kak |
| 2024-11-03 | [Quadruped not walking](https://x.com/k7agar/status/1853162281049501696) | Simulation visually verified; method/speed unverified |
| 2024-11-07 | [Trying a two-leg stand](https://x.com/k7agar/status/1854504273775902852) | Own recreation attempt; quoted Unitree demo belongs to others |
| 2024-12-20 | [Robot-learning experiment](https://x.com/k7agar/status/1870120645402513714) | Quoted research reference; setup unverified |
| 2024-12-21 | [Seeing a robot in real life](https://x.com/k7agar/status/1870463762534478051) | Observation of a robot, not established as own build |
| 2025-01-09 | [Shaders in Ghostty](https://x.com/k7agar/status/1877461954068975878) | Craft software |
| 2025-01-18 | [Kurma dancing](https://x.com/k7agar/status/1880636472623309130) | Real hardware; controller/speed unverified for this clip |
| 2025-01-22 | [Reviving an old 3D printer](https://x.com/k7agar/status/1882107678857867660) | Craft hardware |
| 2025-01-31 | [CRT console plan](https://x.com/k7agar/status/1885325900415459359) | Planned build, not completed console |
| 2025-02-22 | [Kurma wireless walking](https://x.com/k7agar/status/1893329498948432067) | Explicitly remote controlled; RL planned |
| 2025-02-24 | [3D-printing clip](https://x.com/k7agar/status/1894056957708738822) | Craft |
| 2025-04-11 | [GitHub bug recording](https://x.com/k7agar/status/1910624564712812828) | Other software |
| 2025-04-22 | [One hour on a 4090](https://x.com/k7agar/status/1914701717087662477) | Training experiment; task/setup needs context |
| 2025-05-30 | [Short experiment clip](https://x.com/k7agar/status/1928529096167870639) | Context unverified |
| 2025-06-04 | [Go2 keyboard locomotion](https://x.com/k7agar/status/1930234594348953721) | Explicit keyboard control; environment unverified |
| 2025-06-10 | [Robot build clip](https://x.com/k7agar/status/1932416266331193353) | Controller/environment unverified |
| 2025-06-11 | [Robot sounds](https://x.com/k7agar/status/1932820193878946143) | Hardware experiment; controller unverified |
| 2025-06-11 | [Untitled robot clip](https://x.com/k7agar/status/1932821849102283219) | Context unverified |
| 2025-06-12 | [Walking progress](https://x.com/k7agar/status/1933165689956900881) | Post credits Upsurge Labs; controller unverified |
| 2025-06-13 | [AR demo](https://x.com/k7agar/status/1933451826273398803) | Credits @shourshot; do not attribute their work to Atharva |
| 2025-06-15 | [Banana-seeking robot](https://x.com/k7agar/status/1934097579035578561) | AGI caption is a joke, not a result |
| 2025-06-15 | [LeRobot hackathon](https://x.com/k7agar/status/1934204568847655355) | Event at Lossfunk; team context |
| 2025-06-18 | [Bimanipulation demo at hackathon](https://x.com/k7agar/status/1935228087643361573) | Shared event demo; individual ownership unverified |
| 2025-06-18 | [Monitoring the situation](https://x.com/k7agar/status/1935259865716588740) | Robot clip; context unverified |
| 2025-06-21 | [ViT/PCA token visualization](https://x.com/k7agar/status/1936366600288166050) | Representation visualization; suggested by @rami_mmo |
| 2025-07-31 | [Early sim-to-real deployment](https://x.com/k7agar/status/1950788162814664765) | Real hardware; vision; PPO, FPO in progress; speed unspecified |
| 2025-08-06 | [Sim-to-real failed attempt](https://x.com/k7agar/status/1953104167482085578) | Real hardware; explicitly pure sim-to-real RL; speed unspecified |
| 2025-08-06 | [Sim-to-real progress](https://x.com/k7agar/status/1953121197300044173) | Real hardware; same-day follow-up; speed unspecified |
| 2025-08-07 | [RL cube pickup](https://x.com/k7agar/status/1953470993558900803) | Real hardware; author confirms reinforcement learning; speed unspecified |
| 2025-09-12 | [Cats and 3D printing](https://x.com/k7agar/status/1966537506393903454) | Craft / personal |
| 2025-09-18 | [LeRobot experiment](https://x.com/k7agar/status/1968737592662249956) | Credits LeRobot team; controller needs verification |
| 2025-10-05 | [Hard rock robotics](https://x.com/k7agar/status/1974872488170438890) | Hardware/music experiment; controller unverified |
| 2025-11-03 | [Robots](https://x.com/k7agar/status/1985347847815065911) | Hardware clip; method unverified |
| 2025-11-08 | [Behavioral cloning](https://x.com/k7agar/status/1987224223392411954) | Real hardware policy rollout; Prime Intellect compute credit |
| 2025-11-15 | [Egocentric-10K hand reconstruction](https://x.com/k7agar/status/1989731085501304998) | HaMeR visualization on Build AI data; no robot rollout |
| 2025-11-20 | [ESP32 kits](https://x.com/k7agar/status/1991600216341115367) | Craft hardware / teaching |
| 2025-12-05 | [Listening to music](https://x.com/k7agar/status/1996972620504313906) | Experiment; context unverified |
| 2026-03-29 | [MacBook harmonium](https://x.com/k7agar/status/2038230382886494550) | Credits @spr4bhu; Craft |
| 2026-04-12 | [robodal policy-serving benchmark](https://x.com/k7agar/status/2043312379258446131) | π0 on Modal; ALOHA simulation; code linked; hardware future work |
| 2026-05-08 | [MolmoAct 2 deployment](https://x.com/k7agar/status/2052546425620406743) | Ai2 model on own hardware; 2×; limited out-of-box capability |
| 2026-07-24 | [Patch Policy reproduction](https://x.com/k7agar/status/2080551476041228335) | Push-T simulation; own reproduction, external original paper |
| 2026-07-26 | [Patch Policy hardware rollout](https://x.com/k7agar/status/2081313497741447559) | M3 Pro inference; X speed unspecified; repo GIF separately 2× |
| 2026-08-06 | [Physical Atari RL](https://x.com/k7agar/status/2085417196839452778) | External camera / physical actuation; collaboration |
| 2026-08-07 | [Physical Atari follow-up](https://x.com/k7agar/status/2085576138961907900) | Credits @4rynv @sahilsapage @LakshyaLalwani7; external camera verified |
| 2026-08-27 | [Zero-shot towel-folding attempt](https://x.com/k7agar/status/2092959111843578262) | RL next is a plan; exact model/speed unverified |
| 2026-09-01 | [π0.5 T-shirt folding](https://x.com/k7agar/status/2094818716433465631) | Real hardware; unseen environment; 4× in author reply |
| 2026-09-06 | [Astra stands a block upright](https://x.com/k7agar/status/2096590458369810679) | With Sujal; camera/joint-angle interface; repeatability described as mixed |
| 2026-09-06 | [Astra table wiping](https://x.com/k7agar/status/2096593654320341027) | Sustained task experiment; AGI speculation is not an achieved result |
| 2026-09-06 | [Folding then undoing progress](https://x.com/k7agar/status/2096601215652249753) | Real hardware; head + wrist views; speed unanswered |
| 2026-09-07 | [Cloth folding](https://x.com/k7agar/status/2097014434745201002) | With Tirth Gada; exact setup/speed unverified |
| 2026-09-09 | [Human video → storyboard → robot action](https://x.com/k7agar/status/2097750401789685824) | Experimental pipeline; method/speed needs fuller documentation |
| 2026-09-12 | [UMI-style gripper test](https://x.com/k7agar/status/2098782572247703814) | Human-operated hardware interface; inspiration YosubShin/yam-umi |
| 2026-09-13 | [UMI build timelapse](https://x.com/k7agar/status/2099080341210452400) | Explicit timelapse; speed factor unspecified |

## Photo-grid leads and SRA source additions

`photo-inventory.csv` now retains 97 curated robotics, research-reference, Craft and corrected/excluded image leads (44 additions in the second audit). `photo-grid-index.csv` retains all 602 photo-post links. UTC dates explicitly come from public post IDs, with IST calendar dates alongside; individual-page verification is recorded separately. External paper/architecture images are reference leads, never assumed to be Atharva’s work. `image-audit.md` describes the missing experiments, suggested placements and corrected attribution. Website copy/layout were left unchanged during this second audit for Atharva's rewrite.

Revisited the published Craft Google Doc after the user requested Wall-E / SRA-VJTI. Its explicit contribution notes: team manufactured, tested and sold kits for over 300 students; Atharva taught manipulation to 100+ students with Mario. The figures are Atharva’s own existing account, not an independently audited attendance/sales count. Dates are not specified. The public Wall-E and Mario repositories were read in the browser to check hardware, control and workshop descriptions.

Six Doc source images preserved; three used in the page: Wall-E kits, SRA team and assembled robots. The Mario group image is a stylized illustration, not an unmodified documentary photograph; it is not currently placed in the page. `assets/images/sra-manifest.json` records provenance and unspecified dates. Wall-E’s 4:57 YouTube video is linked from a local image. Both official embed domains returned blank player documents in the in-app browser; the final UI opens the original watch page rather than showing a broken frame.

## Local implementation and media storage

- Requested route: `/robotics` (static directory resolves to `/robotics/`), implemented by `robotics/index.html`. Old draft URL `robot-learning.html` forwards there.
- No framework/build step. Existing typography remains in `style.css`; page-specific layout is `robot-learning.css`; a small script pauses other local clips when a new one starts.
- 13 full-length X clip derivatives: 25.18 MB total; 13 WebP posters: 328 KB. No added speedup, crop or time trimming. Original audio retained with AAC compression where present. Video preload is none.
- Permanent source archive: `/home/sra/ksagar/ksagar-site-originals-2026-09-14`, outside both the website and Git repo. Contains 13 selected X platform renditions and six Google Doc source images, plus manifests. Camera-master originals have not been supplied. Original repository photos remain untouched.
- Quoted Ai2 and Patch Policy authors’ videos were excluded from the site and selected original archive. Attribution follows the actual chosen asset IDs, not just the containing post.
- Repository storage is reasonable for this first local pass. Keep only web derivatives in the site; revisit hosting if the collection grows materially. Nothing purchased, uploaded, pushed or deployed.
