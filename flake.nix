{
  description = "A very basic flake";
  # Provides abstraction to boiler-code when specifying multi-platform outputs.
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [ 
            (texlive.combine {
              inherit (pkgs.texlive) scheme-small collection-langcyrillic preprint invoice
              collection-fontsrecommended collection-latexrecommended latexmk titlesec;
          })
        ];
      };
    });
}
