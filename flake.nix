{
  description = "Development environment for Python";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { system = system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs.python313Packages; [
	    jupyter
	    ipykernel
	    numpy
	    pandas
	    scikitlearn
	    scipy
	    matplotlib
        ];
      };
    };
}
