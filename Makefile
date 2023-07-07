nrf:
		doas nixos-rebuild switch --flake ".#nixos"
		
hrf:
		home-manager switch --flake ".#ghost"

tr:
		home-manager switch --flake ".#ghost" && hyprctl reload

nixvim:
		pushd /etc/nixos/nixvim; git add .; popd; home-manager switch --flake ".#ghost"

all:
		doas nixos-rebuild switch --flake ".#nixos"
		home-manager switch --flake ".#ghost" && hyprctl reload


	
