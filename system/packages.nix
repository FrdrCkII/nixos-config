{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    vim wget git
    yazi fastfetch
    zip unzip p7zip
  ];
}