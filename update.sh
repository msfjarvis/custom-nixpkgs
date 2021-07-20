#!/usr/bin/env bash

set -euxo pipefail

declare -a ITEMS=(
	adx
	fclones
	git-branchless
	git-quickfix
	grit
	helix
	lychee
	natls
	pidcat
	rust-script
)

for item in "${ITEMS[@]}"; do
  nix-update --commit --build "${item}"
done
