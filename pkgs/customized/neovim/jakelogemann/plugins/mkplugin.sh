#!/usr/bin/env nix-shell
#! nix-shell -p nix-prefetch-git jq
cd $(dirname $0)
readonly METADATA=$(nix-prefetch-git --quiet --url $1)
readonly URL=$(echo $METADATA | jq -er '.url')
readonly REV=$(echo $METADATA | jq -er '.rev')
readonly SHA256=$(echo $METADATA | jq -er '.sha256')
readonly FETCH_SUBMODULES=$(echo $METADATA | jq -er '.fetchSubmodules')
readonly NAME=$(basename $URL | sed 's/\.git$//')

cat <<-EOF > $(dirname $0)/$NAME.nix
{ fetchgit, vimUtils, ... }:

vimUtils.buildVimPlugin {
  name = "$NAME";
  dependencies = [];
  dontBuild = true;
  src = fetchgit {
    url = "$URL";
    rev = "$REV";
    sha256 = "$SHA256";
    fetchSubmodules = $FETCH_SUBMODULES;
  };
}
EOF
