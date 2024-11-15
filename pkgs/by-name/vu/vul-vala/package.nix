{ lib, stdenv
, fetchgit
, pkg-config
, libarchive
, libgee
, meson
, ninja
, gobject-introspection
, vala
, wrapGAppsHook4
}:

stdenv.mkDerivation rec {
  pname = "vul-vala";
  version = "unstable-2024-11-07";

  src = fetchgit {
    url = "https://gitlab.gnome.org/BZHDeveloper/vul";
    rev = "d17c04b292ba6d971f920b0413aabb25c1ce30ae";
    sha256 = "sha256-UIE0tYs5H0x5yX6Dhc3VSNAvNVUmmlQz1a0TMWoJLa4=";
  };

  nativeBuildInputs = [
    gobject-introspection
    meson
    ninja
    pkg-config
    vala
    wrapGAppsHook4
  ];

  buildInputs = [
    libarchive
    libgee
  ];

  meta = with lib; {
    description = "Vala Utility Libraries (Streams, Text, JSON, Archive, ...)";
    homepage = "https://gitlab.gnome.org/BZHDeveloper/vul";
    license = licenses.lgpl3;
    platforms = platforms.linux;
    maintainers = with maintainers; [ dvn0 ];
  };
}
