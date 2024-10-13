{ pkgs, ...}:

{
  home.packages = with pkgs; [
    zed-editor
    locale
    p7zip
    mpvpaper
    nordzy-cursor-theme
    nerdfonts
    aria2
    wl-clipboard
    lua-language-server
    tree-sitter
    cargo-generate
    arrpc
    vesktop
    nchat
    meson
    cmake
    libreoffice
    yt-dlp
    flac
    kid3-qt
    krita
    kde-rounded-corners
    flutter
    obs-studio
    lunarvim
    php
    fzf
    fd
    gimp
  ];
}
