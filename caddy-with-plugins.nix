{ pkgs, config, ... }:

with pkgs; stdenv.mkDerivation rec {
  pname = "caddy-plugin";
  version = "0.1.0";

  src = fetchurl {
    url = "https://caddyserver.com/api/download?os=linux&arch=arm64&p=github.com%2Fcaddy-dns%2Fporkbun";
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
  ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    install -m755 -D caddy_linux_arm64_custom $out/bin/caddy
    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://caddyserver.com";
    description = "Caddy Webserver with plugins!";
    platforms = platforms.linux;
  };
}