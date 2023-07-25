nrf:
		git add . 
		doas nixos-rebuild switch --flake ".#${HOST}"
		
hrf:
		git add . 
		home-manager switch --flake ".#${USER}"

hyr:
		git add . 
		home-manager switch --flake ".#${USER}" && hyprctl reload

nixvim:
		pushd /etc/nixos/nixvim; git add .; popd
		nix flake lock --update-input neovim-conf
		home-manager switch --flake ".#${USER}"

all:
		git add .
		doas nixos-rebuild switch --flake ".#${HOST}"
		home-manager switch --flake ".#${USER}" && hyprctl reload


	
