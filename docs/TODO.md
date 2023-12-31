- ## Home manager
  - ## Neovim
    - [x] Move neovim from external flake into system.
    - [ ] Add neovim keybindings for telescope.
    - [x] Neovim nix config.
  - ## Telegram
    - [_] Create telegram wrapper with {https://github.com/viperML/wrapper-manager}.
      - [x] Used vanilla nix stuff.
    - [x] Add telegram keybindings.
  - ## WM stuff
    - [x] Move hyprland autostart to systemd services.
    - [ ] Make waybar modules top and bottom padding more.
    - [ ] Font config.
    - [ ] Add this [rust-tools]{https://github.com/simrat39/rust-tools.nvim} plugin.
    - [ ] Add browser notify's for dunst.
- [ ] Create zellij layouts with names. https://zellij.dev/tutorials/layouts/.
- [ ] Move zsh aliases to nix
- [x] Make home-manager separated.
- [x] Add zsh plugins, and setup it.
- [x] Browser nix config.
- [x] Move all home autostart things to systemd.

- ## General
- [ ] Pass insted keepassxc.
- [ ] Add secrets manager.
- [ ] Make different configuration options for automation.
- [ ] Add automate laptop lock.
- [ ] Add tpm encription management.
  - [ ] Deal with bios password.
- ## Filesystems
  - [ ] Disc partition
  - [ ] /nix/store separated volume with `nocow` option #btrfs
  - [x] Create btrfs snapshot for home files.
    - [x] Automate backups with btrbk.
- ## Packages

  - [-] Migrate invidtui to nix.
    - some issues, videos not playing.
  - [ ] Ayuagram
  - [ ] linux kernel

- [ ] Hypr picker theme when selecting source for display.
- [x] Switch todos to `.md`.
  - migrating from norg to logseq
- [x] Colors configuration.
- [ ] Add custom kernel {https://github.com/johnrichardrinehart/JohnOS/blob/cca38212232a8ab664ef8e56181a05d59a4494ee/modules/kernel.nix#L14-L46}

- ## Unactual
- fix, nixos sometimes stucks on switch root sytemd state. # seems it was only on one version of something.
- ~~Learn tmux.~~ # Zellij better.
