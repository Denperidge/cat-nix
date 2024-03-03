# cat-nix
Files for my NixOS setups!

## Caddy-With-Plugins
1. File setup:
    - Fork/copy [caddy-with-plugins.nix](caddy-with-plugins.nix)
    - Modify the download url & output filename based on 
   [caddyserver.com/download](https://caddyserver.com/download) output
2. Add the following to your configuration.nix
    ```nix
    # /etc/nixos/configuration.nix
    services.caddy = {
        enable = true;
        package = pkgs.fetchurl {
          # Change the url to your fork
          url = "https://raw.githubusercontent.com/Denperidge/cat-nix/main/caddy-with-plugins.nix";
          hash = "";  # This will be empty for now!
        };
    };
    ```
3. Run `nixos-rebuild switch`
4. This will fail and give you a hash. Copy it!
    ```bash
    error: hash mismatch in fixed-output derivation '/nix/store/ychx8jz5ba1djj6k844c65940aswzgzz-default.nix.drv':
         specified: sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
            got:    sha256-bREvyUpc9m1nA7VHOSeZ0juiSquD90sCmlKHynoLpL4=
    ```
    *(In this case, copy `sha256-bREvyUpc9m1nA7VHOSeZ0juiSquD90sCmlKHynoLpL4=`)*
5. Write the hash in configuration.nix
    ```nix
    # /etc/nixos/configuration.nix
    services.caddy = {
        enable = true;
        package = pkgs.fetchurl {
          # Change the url to your fork
          url = "https://raw.githubusercontent.com/Denperidge/cat-nix/main/caddy-with-plugins.nix";
          hash = "sha256-bREvyUpc9m1nA7VHOSeZ0juiSquD90sCmlKHynoLpL4=";
        };
    };
    ```
6. Run `nixos-rebuild switch`!
