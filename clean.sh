sudo nix profile wipe-history --profile /nix/var/nix/profiles/system
sudo nix-collect-garbage --delete-old
nix-collect-garbage --delete-old