{ pkgs
, ...
}: {
  environment.systemPackages = with pkgs; [
    # toolchains
    clang
    gcc
    rustc
    cargo

    # lsp's
    rnix-lsp
    rust-analyzer
  ];
}
