#!/usr/bin/env bash

set -euxo pipefail

declare -a ITEMS=(
  adb-sync
  adx
  clipboard-substitutor
  gdrive
  pidcat
)

PKG="${1:-}"
VERSION="${2:-}"
NO_BUILD="${NO_BUILD:-}"
declare -a PARAMS=("--commit")
if [ -z "${NO_BUILD}" ]; then
  PARAMS+=("--build")
fi

if [ -z "${PKG}" ]; then
  for item in "${ITEMS[@]}"; do
    nix-update "${PARAMS[@]}" "${item}"
  done
elif [ -z "${VERSION}" ]; then
  nix-update "${PARAMS[@]}" "${PKG}"
else
  nix-update "${PARAMS[@]}" "${PKG}" --version "${VERSION}"
fi
