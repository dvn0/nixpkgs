{ lib, buildGoModule, fetchFromGitHub }:

let
  version = "0.3.13";
in
buildGoModule {
  pname = "marmot";
  inherit version;

  src = fetchFromGitHub {
    owner = "maxpert";
    repo = "marmot";
    rev    = "v${version}";
    sha256 = "sha256-oRLrbyl9BtI+JyLb848ly1x8ggZaexdKmZ5HBdsjxlY=";
  };

  proxyVendor = true;
  vendorSha256 = "sha256-T64y0gwQkkBwqY6UQYKXedXs1uLFfTSJE2WGWsWU29k=";

  meta = {
    description = " A distributed SQLite replicator";
    homepage = "https://github.com/maxpert/marmot";
    license = lib.licenses.mit;
  };
}
