export def twm [
  link: string # Twitter link source
  out?: string # Output filename without the file extension
  ...extra     # Extra args for yt-dlp
] {
  mut out = $out
  match $out {
    null => {
      let tweet_id = ($link | parse 'https://x.com/{user}/status/{id}?{rest}' | get id.0)
      let mp4_file = (ls | where name =~ $"[($tweet_id)]" | first)
      let fname = ($mp4_file.name | path parse | get stem)

      if ($mp4_file | is-not-empty) {
        yt-dlp $link -o $"($fname).mp4" ...$extra
      } else {
        yt-dlp $link ...$extra
      }
      $out = $fname
    },
    _ => { yt-dlp $link -o $"($out).mp4" ...$extra },
  }
}

export def twg [link: string] {
  let path = [
    $'(pwd)/twitter/',
    ($link | str replace -r 'https://(?:x|twitter)\.com/([^/]+)/status/([^?&]+).*' '$1/$2'),
    '_1.mp4'
  ] | str join

  (gallery-dl
    --cookies-from-browser zen
    -d .
    $link)

  if $env.LAST_EXIT_CODE == 0 { gify $path }
}

export def ytm [url: string] {
  (yt-dlp
    --extract-audio
    --audio-format mp3
    -o "%(title).%(ext)"
    -f "bestaudio"
    $url)
}

export def gify [fname: string] {
  let fmt = "fps=16,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse,trim=start=0,setpts=PTS-STARTPTS"

  (ffmpeg
    -i $"($fname)"
    -vf $fmt
    -loop 0
    $"($fname | str replace 'mp4' 'gif')")
}
