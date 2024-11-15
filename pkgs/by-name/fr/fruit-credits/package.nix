{ lib, stdenv, fetchFromGitea
, buildPackages
, vala, meson, wrapGAppsHook4, pkg-config, gettext
, libadwaita
, libgee
, glib
#, gobject-introspection, glib, gdk-pixbuf, gtk4, glib-networking
, hledger
, vul-vala
, blueprint-compiler
, desktop-file-utils
, ninja
, nix-update-script
}:

stdenv.mkDerivation rec {
  pname = "fruit-credits";
  version = "0.1.1";

  src = fetchFromGitea {
    domain = "codeberg.org";
    owner = "dz4k";
    repo = "fruit-credits";
    rev = "v${version}";
    sha256 = "sha256-c5XTeF+ihSX0f49zCNUuCIaX49+ZFIPkFEskJqJ54PM=";
  };

  nativeBuildInputs = [
    vala
    meson
    ninja
    pkg-config
    wrapGAppsHook4
    desktop-file-utils # for update-desktop-database
  ];

  buildInputs = [
    glib
    hledger
    libadwaita
    libgee
    vul-vala
    blueprint-compiler
  ];

  wrapperPath = lib.makeBinPath ([
    hledger
  ]);

  passthru.updateScript = nix-update-script { };

  meta = with lib; {
    description = "A GNOME app for hledger, the plain text accounting program.";
    mainProgram = "fruit-credits";
    homepage = "https://fruitcredits.dz4k.com/";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
    maintainers = with maintainers; [ dvn0 ];
  };
}
