"""Validate local page references and media manifests without dependencies."""
import json
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import unquote, urlsplit

ROOT = Path(__file__).resolve().parents[1]

class Page(HTMLParser):
    def __init__(self, path):
        super().__init__()
        self.path, self.ids, self.links = path, set(), []
        self.feed(path.read_text())

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)
        if 'id' in attrs:
            self.ids.add(attrs['id'])
        for key in ('href', 'src', 'poster', 'data-poster'):
            if attrs.get(key):
                self.links.append(attrs[key])
        if tag == 'meta' and attrs.get('property') in ('og:image', 'og:image:secure_url'):
            self.links.append(attrs['content'])
        if tag == 'meta' and attrs.get('name') == 'twitter:image':
            self.links.append(attrs['content'])


def main():
    pages = {p.resolve(): Page(p) for p in ROOT.rglob('*.html') if '.git' not in p.parts}
    errors = []
    def check(path, source, fragment=''):
        path = path.resolve()
        if path.is_dir():
            path /= 'index.html'
        if not path.is_file():
            errors.append(f'{source}: missing {path}')
        elif fragment and path in pages and unquote(fragment) not in pages[path].ids:
            errors.append(f'{source}: missing anchor #{fragment} in {path}')
    for path, page in pages.items():
        for link in page.links:
            url = urlsplit(link)
            if url.netloc == 'ksagar.site':
                target = ROOT / unquote(url.path).lstrip('/')
            elif url.scheme or url.netloc:
                continue
            elif url.path.startswith('/'):
                target = ROOT / unquote(url.path).lstrip('/')
            else:
                target = path.parent / unquote(url.path) if url.path else path
            check(target, path.relative_to(ROOT), url.fragment)
    for manifest in (ROOT / 'data/media').glob('*.json'):
        data = json.loads(manifest.read_text())
        entries = data if isinstance(data, list) else data['items']
        for entry in entries:
            for key in ('image', 'video', 'poster', 'derived'):
                values = entry.get(key, [])
                for value in values if isinstance(values, list) else [values]:
                    check(ROOT / value, manifest.relative_to(ROOT))
    if errors:
        raise SystemExit('\n'.join(errors))
    print(f'PASS: {len(pages)} pages; local links, assets, anchors, and media manifests resolve.')

if __name__ == '__main__':
    main()
