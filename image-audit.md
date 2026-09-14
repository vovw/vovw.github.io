# Second image audit — 14 September 2026

This is an editing companion, not new website copy. The approved layout and all page text were left alone for Atharva's rewrite.

## What was covered

- Re-scrolled the photo-only X grid to the oldest entry. Three further bottom scrolls produced no older entries.
- Visually reviewed all **602 photo-grid previews** across **68 overlapping browser screenshots**, from **12 September 2026 to 13 January 2022**. All 602 thumbnails had loaded on this pass.
- The previous 607-link count comprised these **602 photo links plus five mixed-media video links**. It was not 607 distinct photographs. Posts can contain multiple attachments and quoted media.
- Opened **91 selected relevant or ambiguous posts**, reading their text, source dates, available parent/quoted posts and relevant visible replies. Opened and inspected **all 26 pictures across 10 relevant multi-image posts**, in addition to the grid previews and selected single-image enlargements.
- Confirmed the oldest post directly: [Linux desktop customization, 13 January 2022](https://x.com/k7agar/status/1481648861781569536). It had failed to open in the earlier pass. A temporary loading failure on a workshop post also recovered on retry.
- Saved all 602 dated source links in `photo-grid-index.csv`. Expanded `photo-inventory.csv` from **53 to 97 curated entries**, including **44 additions** and corrections to existing leads. Each row distinguishes post-context verification from a grid-only lead.

This covers the end exposed by X's media UI. It does not recover deleted/private/unavailable posts, open every personal or meme post, or inspect every attachment behind all 602 previews. The 91-post context review and 26-image gallery count are deliberately separate from the grid count. No social interactions, uploads, commits, pushes or deployment occurred.

Dates in the shortlist below use **Asia/Kolkata**. Both UTC timestamps derived from public post IDs and IST calendar dates are retained in the CSV. An edited post's displayed edit time need not equal its creation timestamp.

## Strong additions for the rewrite

| Date (IST) | Source | What it adds / possible placement |
| --- | --- | --- |
| 9 Oct 2024 | [Deep-RL and robot-dog update](https://x.com/k7agar/status/1844079643084849306) | A verified early starting point: implementing deep-RL papers and trying to make a robot dog walk. Simulation screenshot; pair with the already inventoried November simulation attempts. This predates the July 2025 arm demos but does not establish earlier successful hardware transfer. |
| 11–16 Nov 2024 | [Lab and tuning](https://x.com/k7agar/status/1855998073807491487), [Bakasur follow-up](https://x.com/k7agar/status/1857720599545786868) | Early SRA/Wall-E context: track mats, electronics, tuning and a personally reported win. Keep the exact competition/result unspecified until supplied. |
| 13 Jan–15 Mar 2025 | [Team assembly](https://x.com/k7agar/status/1878798744935895115), [rebuilding Kurma](https://x.com/k7agar/status/1897746345089532173), [extra assembly image](https://x.com/k7agar/status/1900767082113065297/photo/3) | A much clearer Kurma build sequence. The third image in a printer-repair post was easy to miss. Pair with the remote-controlled February video, keeping RL as a stated next step in that period. |
| 26 Mar–7 Apr 2025 | [Laser-cut manipulator](https://x.com/k7agar/status/1904872735798341686), [tiny arm](https://x.com/k7agar/status/1908462941352980818), [printed arm](https://x.com/k7agar/status/1909264016121168283) | Hardware progression around the Mario/teaching story. Verify exact workshop roles before using a photo as evidence of a specific teaching claim. The laser-cut arm is mounted on an electronics base; the earlier mobile-arm label was inaccurate. |
| 12 May 2025 | [RoPE comparison](https://x.com/k7agar/status/1921950803813683642), [worse-performing follow-up](https://x.com/k7agar/status/1921988126286790761) | An omitted nanoVLM experiment with an honest negative result. Basic scaling versus dynamic frequency scaling; another ~10k steps did not redeem it. Author reports nanoVLM PR 37 was merged; repository status/contribution still needs checking before that becomes a website claim. |
| 2 Jun 2025 | [Flow-matching digits](https://x.com/k7agar/status/1929290912745607376), [3k vs 30k steps](https://x.com/k7agar/status/1929292264020287544) | Small generative-model experiment; useful Craft item or brief technical background. These are generated digits, not robot trajectories. |
| 4 Jun 2025 | [Locomotion reward/episode length](https://x.com/k7agar/status/1930209603947556942), [Go2 thread plot](https://x.com/k7agar/status/1930238364998832435) | Results beside the early locomotion discussion. Charts are training reward and episode length; the author casually calls them loss curves. Do not turn these into a hardware success-rate claim. |
| 20–29 Jun 2025 | [Similarity-based saliency](https://x.com/k7agar/status/1936104602308690148), [layers 19/39](https://x.com/k7agar/status/1936154358812708968), [blog announcement](https://x.com/k7agar/status/1939293943533052143) | The strongest missing representation-work material: visualizations, a layer comparison and the [V-JEPA essay](https://ksagar.bearblog.dev/vjepa/). These are Atharva's exploration/explanation of Meta's model, distinct from authorship of V-JEPA itself. |
| 24 Aug–20 Nov 2025 | [CustomRot-32 designs](https://x.com/k7agar/status/1959404593336770806), [component delivery](https://x.com/k7agar/status/1982467315674579188), [kit sorting](https://x.com/k7agar/status/1986837557506941253), [Wall-E PCB](https://x.com/k7agar/status/1987803953158033641), [board batch](https://x.com/k7agar/status/1988649278596870623), [packed kits](https://x.com/k7agar/status/1991496243558977891) | A dated SRA production sequence to complement the current Doc photos. The October [70+ kit batch](https://x.com/k7agar/status/1982467421006168077) and [parts explanation](https://x.com/k7agar/status/1982708097471910276) are specific author-reported figures; keep them separate from the Doc's cumulative 300+ students. |
| 30 Oct 2025 | [Flight-controller workbench](https://x.com/k7agar/status/1983609932135145647) | The replies reveal a previously missed project: trying to make a flight controller on a cheap F450 setup. Good Craft or hardware-side note; this was a team effort and a work in progress. |
| 21 Nov 2025 | [SAM 3D reconstruction](https://x.com/k7agar/status/1991597963190366308), [parent post](https://x.com/k7agar/status/1991594389706277358) | Distinct from the existing HaMeR demo. Possible continuation of the human-video section. The [SAM 3D + Map Anything + RL idea](https://x.com/k7agar/status/1991594656384315901) was proposed investigation, not a completed training pipeline. |
| 14 Dec 2025 | [Loss-curve caveat](https://x.com/k7agar/status/2000173019503996952) | Fits the failures/limits discussion: a falling training loss does not by itself tell us whether the robot works. Exact model and evaluation remain unspecified. |
| 27 Jan 2026 | [Self-refining sampling with Cosmos Policy](https://x.com/k7agar/status/2016204003974271090) | An omitted experiment between demonstrations and pretrained policies: latent refinement at sampling time without retraining. Uses external work, including arXiv:2601.18577. No numerical success-rate gain or evaluation protocol verified. |
| 11 Apr–12 Sep 2026 | [Early UMI CAD](https://x.com/k7agar/status/2042978771872157918), [Insta360 proposal](https://x.com/k7agar/status/2042979671328068096), [later design credit](https://x.com/k7agar/status/2098783385355444667) | A progression from design exploration to the already featured human-operated interface. April firmware/camera ideas remain plans; preserve Generalist/Varun and yam-umi attribution where applicable. |
| 8 May / 7 Aug 2026 | [MolmoAct mount problem](https://x.com/k7agar/status/2052550568355520542), [physical Atari camera](https://x.com/k7agar/status/2085580125148704777) | Setup photographs belong directly beside the corresponding demos. One explains a camera-mount failure; the other establishes external-camera input and physical servo actuation. |
| 9–12 Sep 2026 | [Source storyboard](https://x.com/k7agar/status/2097750512187933138), [block placement](https://x.com/k7agar/status/2097729854661894189), [generated UMI instructions](https://x.com/k7agar/status/2098786847241695591) | Good material for next steps: input storyboard versus physical action, and AI assistance in making hardware instructions. The assembly sheet is explicitly AI-generated; it is not a photo sequence or independently validated assembly manual. |

## Attribution corrections to keep

- The November 2025 **Wall-E v2.7 PCB reverse credits Vishal Mutha and Shaunak Datar**. The August CustomRot-32 design credits **Varun Malekar and Archit More**. Atharva's workshop/production contribution must stay distinct from board-design authorship.
- The [March 2026 bionic hand](https://x.com/k7agar/status/2038239660825313786) is linked by Atharva to [Sahil Apage's build](https://x.com/sahilsapage/status/2038125218598912037), using an upstream Hugging Face design.
- The April red “gripper” lead is a detail of [Bhakti's MAYA drone](https://x.com/k7agar/status/2047225144314351912). Atharva states he filmed its video; this does not establish that he built it.
- The November 21 reconstruction is **SAM 3D**, not the November 15 **HaMeR** experiment. Keep their media and methods separate.
- The purple “PCB batch” from December 2023 is a **keyboard PCB**. The May 2023 LED photo is a **notpink message display**; it does not establish an own electronics build.
- “CASIOPEA robots” was **album artwork of racing cars**. The purported robot diagnostic plots were a **Julia plotting recommendation**, and a colored-strip “token visualization” was an **Anthropic status screenshot**. All corrected in the CSV.
- The purple robot arm appears in a four-image aesthetic collection alongside a hoodie, meme and laptop design. Treat its construction credit as unresolved.
- NVIDIA scaling charts, DreamZero, EgoBridge, Toru's sim-to-real humanoid work and Physical Intelligence's robot images are **external references**, not personal results.

## Remaining details for later writing

No answer is needed to finish this audit. Before publishing claims, fill in the nanoVLM contribution/PR details, Cosmos experiment configuration/evaluation, the October/December VLA run metadata, the SAM 3D input/procedure, and specific team roles for older hardware. Research authorship remains deferred as requested.

No new media files were added to the site during this audit. The existing 13 clips, posters and layout are unchanged. When choosing images for the rewrite, take original-size copies of selected own/authorized images into the separate archive, create compressed site derivatives, and record per-image source links and credits. The grid thumbnails are discovery evidence, not publication masters.

## Follow-up: selected images added locally

At Atharva's request to sprinkle images through the page, seven reviewed images were added on 14 September 2026: workshop parts and the Wall-E PCB in SRA; the camera-mount photo by MolmoAct; the earlier V-JEPA similarity-based saliency figure after dense features; the external camera by physical Atari; and UMI CAD plus the human-input storyboard near next steps. Their dated source links and credits sit with the figures. The existing paragraphs and all 13 video elements remain unchanged for Atharva's rewrite.

The exact X renditions observed in the photo viewer are archived separately under `ksagar-site-originals-2026-09-14/twitter-images/`; these are platform copies, not camera masters. Seven full-frame WebPs (about 548 KB total) and `assets/images/twitter-manifest.json` were added to the local site. No assets have been uploaded or published.
