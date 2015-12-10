{ mkDerivation
, file-embed
, ghcjs-dom
, mtl
, raw-strings-qq
, reflex
, reflex-dom
, syb
, text
}:

mkDerivation {
  pname = "reflex-todomvc";
  version = "0.1";
  src = builtins.filterSource (path: type: baseNameOf path != ".git") ./.;
  isExecutable = true;
  isLibrary = true;
  buildDepends = [
    file-embed
    ghcjs-dom
    mtl
    raw-strings-qq
    reflex
    reflex-dom
    syb
    text
  ];
  license = null;
}
