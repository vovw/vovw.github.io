"""Make local web derivatives from separately archived source clips.

Usage: python3 tools/prepare_media.py /path/to/originals
Requires ffmpeg/ffprobe; the site itself needs no build step or Python.
"""
import hashlib
import json
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
ARCHIVE = Path(sys.argv[1]).resolve()
MANIFEST = ROOT / 'assets/media/manifest.json'

def probe(path):
    return json.loads(subprocess.check_output([
        'ffprobe', '-v', 'error', '-show_streams', '-show_format', '-of', 'json', str(path)
    ]))

entries = json.loads(MANIFEST.read_text())
for item in entries:
    original = ARCHIVE / item['original_filename']
    if not original.is_file():
        print(f'Missing original, skipped: {original}')
        continue
    destination = ROOT / item['video']
    poster = ROOT / item['poster']
    if not destination.exists():
        subprocess.run([
            'ffmpeg', '-hide_banner', '-loglevel', 'error', '-i', str(original),
            '-map', '0:v:0', '-map', '0:a?',
            '-vf', "scale=w='min(960,iw)':h='min(720,ih)':force_original_aspect_ratio=decrease:force_divisible_by=2",
            '-c:v', 'libx264', '-preset', 'slow', '-crf', '27', '-pix_fmt', 'yuv420p',
            '-c:a', 'aac', '-b:a', '80k', '-movflags', '+faststart', '-map_metadata', '-1', str(destination)
        ], check=True)
    if not poster.exists():
        subprocess.run([
            'ffmpeg', '-hide_banner', '-loglevel', 'error', '-ss', str(item.get('poster_time', 0.5)),
            '-i', str(destination), '-frames:v', '1', '-c:v', 'libwebp', '-quality', '82', str(poster)
        ], check=True)
    data = probe(destination)
    video = next(s for s in data['streams'] if s['codec_type'] == 'video')
    source = probe(original)
    item.update({
        'width': video['width'], 'height': video['height'],
        'duration_seconds': float(data['format']['duration']),
        'source_duration_seconds': float(source['format']['duration']),
        'original_bytes': original.stat().st_size, 'video_bytes': destination.stat().st_size,
        'poster_bytes': poster.stat().st_size,
        'original_sha256': hashlib.sha256(original.read_bytes()).hexdigest(),
        'transformation': 'Full duration; proportional resize; H.264 CRF 27; faststart; AAC audio; original timing preserved.'
    })
    print(f"{item['slug']}: {item['video_bytes'] / 1e6:.2f} MB, {item['duration_seconds']:.2f}s")
MANIFEST.write_text(json.dumps(entries, indent=2, ensure_ascii=False) + '\n')
