{ lib
, stdenvNoCC
, fetchFromGitHub
}:

stdenvNoCC.mkDerivation {
  pname = "catppuccin-sddm";
  version = "1a58b5c2d898a70c22e4d9462039111f5613a7c0";

  src = fetchFromGitHub {
    owner = "catppuccin";
    repo = "sddm";
    rev = "1a58b5c2d898a70c22e4d9462039111f5613a7c0";
    hash = "sha256-cZuNQDXdWiE2eCf/bdGFYKM5SXrENxJere83SI47ol4=";
  };

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/share/sddm/themes/"
    cp -r src/* "$out/share/sddm/themes"
 
    runHook postInstall
  '';

  meta = {
    description = "Soothing pastel theme for SDDM";
    homepage = "https://github.com/catppuccin/sddm";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
  };
}
