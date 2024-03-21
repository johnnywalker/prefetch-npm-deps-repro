#!/usr/bin/env nix-shell
#! nix-shell -i bash --pure
#! nix-shell -p bash cacert curl prefetch-npm-deps
#! nix-shell -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/f945939fd679284d736112d3d5410eb867f3b31c.tar.gz

export RUST_LOG=info

echo
echo
echo "Running prefetch-npm-deps with *invalid* dependency URL in lock file"
echo " - Command should fail but currently ignores error response"
echo

set -x
prefetch-npm-deps package-lock.invalid.json

set +x
echo
echo
echo "Requesting headers via curl - should be 404"
echo

set -x
curl -I "https://registry.npmjs.org/is-number/-/dead-beef-7.0.0.tgz"
