{
  pkgs ? import <nixpkgs> { },
  mkShell ? pkgs.mkShell,
}:
mkShell rec {
  buildInputs = with pkgs; [
    python38
    python38Packages.requests
  ];

  shellHook = ''
    export PYTHONHTTPSVERIFY=0
    export VIRTUAL_ENV=nix-$(basename $(pwd))
  '';
}
