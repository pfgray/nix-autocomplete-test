{stdenv, installShellFiles}:
  stdenv.mkDerivation {
    name = "dothis";

    nativeBuildInputs = [ installShellFiles ];

    src = ./.;

    installPhase = ''
      runHook preInstall

      mkdir -p $out/bin
      mv dothis $out/bin/

      runHook postInstall
    '';

    postInstall = ''
      installShellCompletion dothis-completion.{bash,fish}
    '';
  }