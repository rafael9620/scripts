```bash
# Default repo application is broke so it's necesary to reinstall it.
pip install -U youtube-dl
```

```bash
url="https://www.youtube.com/watch?v=tRDaDZPYcIE"

~/.local/bin/youtube-dl $url --proxy socks5://127.0.0.1:8010 --write-auto-sub --sub-lang en --no-overwrites --continue --no-playlist --skip-download
```

`--proxy URL`  Use the specified HTTP/HTTPS/SOCKS proxy.  To enable SOCKS proxy, specify a proper scheme.  For example socks5://127.0.0.1:1080/.  Pass in an empty string (--proxy "") for direct connection.

`-c, --continue` Force resume of partially downloaded files.  By default, youtube-dl will resume downloads if possible.

`-w, --no-overwrites` Do not overwrite files

`--skip-download` Do not download the video

`-f, --format FORMAT` Video format code, see the "FORMAT SELECTION" for all the info

`--all-formats` Download all available video formats

`-F, --list-formats` List all available formats of requested videos

`--list-subs` List all available subtitles for the video

`--write-sub` Write subtitle file

`--write-auto-sub` Write automatically generated subtitle file (YouTube only)

`--sub-lang LANGS` Languages of the subtitles to download (optional) separated by commas, use --list- subs for available language tags

`--no-playlist` Download only the video, if the URL refers to a video and a playlist.

`--yes-playlist` Download the playlist, if the URL refers to a video and a playlist.
