{
  config,
  conf,
  ...
}: {
  imports = [
    ./zsh
    ./nushell
    ./starship
    ./zoxide
  ];

  home.shellAliases = let
    fl_path = conf.fl_path;
  in {
    #systemd
    sc = "sudo systemctl";
    jc = "sudo journalctl";
    scu = "systemctl --user";
    jco = "journalctl --user";
    diff = "diff --color=auto";
    lsd = "nix shell n#lsd";

    #useful
    wget = "wget -c";
    ll = "ls -l";
    la = "ls -al";

    nv = "nvim";
    znv = "zellij r -- nv";
    cl = "clear";
    lsblk = "lsblk -o NAME,FSTYPE,SIZE,TYPE,MOUNTPOINTS,STATE,FSSIZE,FSAVAIL";

    zel = "zellij";

    "cd.." = "cd ..";
    "cd..." = "cd ../..";
    "cd...." = "cd ../";

    # nix 
    ncg = "nix-collect-garbage and nix-collect-garbage -d and sudo nix-collect-garbage and sudo nix-collect-garbage -d and sudo rm /nix/var/nix/gcroots/auto/*";
    nrf = "sudo nixos-rebuild switch --flake ${fl_path}";                                                                                                     
    hrf = "home-manager switch --flake ${fl_path}";                                                                                                    
    nsp = "nix search n#";
    fl  = "cd ${fl_path}";                                                                                                                               
    repair = "nix-store --verify --check-contents --repair";
    cleanup = "sudo nix-collect-garbage --delete-older-than 3d and nix-collect-garbage -d";
    run = "nix run n#";       
    search = "nix search n#"; 
    shell = "nix shell n#";   
  };
}
