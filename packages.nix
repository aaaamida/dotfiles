{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    # base packages
    vim wget curl home-manager neovim

    # programming
    ## rust
    cargo
    rustc
    clippy
    rust-analyzer
    ## scala
    metals 
    coursier 
    sbt
    ## go
    go
    revive
    gopls
    delve
    gore
    yaegi
    ## typescript
    bun
    ## python
    python3
    ## C/C++ & build tools
    gcc gnumake glibc
    ## android development
    android-studio
    ## Code Editor
    code-cursor
    zed

    # command-line utils
    locale
    p7zip
    unrar
    ranger
    oh-my-zsh
    fastfetch
    ffmpeg
    vlc
    nix-diff
    mpv-unwrapped
    btop
    lsof ripgrep sccache
    zoxide
    zsh-autosuggestions
    zsh-syntax-highlighting
    wipe
    fd
    killall
    xorg.xev
    wl-clipboard
    steam-run

    # oxide commands
    eza bat gvfs guix
    noto-fonts-cjk-sans
    pciutils ventoy-full
    libnotify fzf
    glibcLocales
    openssl openssl.dev

    # applications
    cloudflare-warp
    steam
    rpcs3
    lutris
    wine
    whatsapp-for-linux
    rustdesk-flutter
    obsidian

    # tools
    pkg-config
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
    vulkan-headers
    vulkan-extension-layer
    amdvlk
    pavucontrol
    gparted

    # display manager packages
    kdePackages.filelight
    kdePackages.kget
    kdePackages.spectacle
    kdePackages.partitionmanager
    polybarFull
    networkmanagerapplet
    rofi
  ];
}
