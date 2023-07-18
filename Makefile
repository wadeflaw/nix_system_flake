nrf:
		git add . 
		doas nixos-rebuild switch --flake ".#nixos"
		
hrf:
		git add . 
		home-manager switch --flake ".#ghost"

hyr:
		git add . 
		home-manager switch --flake ".#ghost" && hyprctl reload

nixvim:
		pushd /etc/nixos/nixvim; git add .; popd; home-manager switch --flake ".#ghost"

all:
		git add .
		doas nixos-rebuild switch --flake ".#nixos"
		home-manager switch --flake ".#ghost" && hyprctl reload


	
