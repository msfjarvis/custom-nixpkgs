#!/usr/bin/env bash

set -euxo pipefail

declare -a ALL_PACKAGES=(
  adb-sync
  adbtuifm
  adx
  bundletool-bin
  clipboard-substitutor
  gdrive
  gitice
  hcctl
  healthchecks-monitor
  hyperlink
  katbin
  linkleaner
  monocraft-nerdfonts
  patreon-dl
  pidcat
  rucksack
  twt
  when
)

declare -A VERSION_REGEX=(
  ["hcctl"]="hcctl-v(.*)"
  ["healthchecks-monitor"]="healthchecks-monitor-v(.*)"
)

PKG="${1-}"
VERSION="${2-}"
NO_BUILD="${NO_BUILD-}"
declare -a PACKAGES_TO_BUILD=()
declare -a BASE_PARAMS=("--commit")
if [ -z "${NO_BUILD}" ]; then
  BASE_PARAMS+=("--build")
fi

if [ -z "${PKG}" ]; then
  PACKAGES_TO_BUILD+=("${ALL_PACKAGES[@]}")
else
  PACKAGES_TO_BUILD+=("${PKG}")
fi

for PACKAGE in "${PACKAGES_TO_BUILD[@]}"; do
  declare -a PARAMS=("${BASE_PARAMS[@]}")
  if [[ -v VERSION_REGEX["${PACKAGE}"] ]]; then
    PARAMS+=("--version-regex")
    PARAMS+=("${VERSION_REGEX["${PACKAGE}"]}")
  fi
  if [ -n "${VERSION}" ]; then
    PARAMS+=("--version")
    PARAMS+=("${VERSION}")
  fi
  PARAMS+=("${PACKAGE}")
  nix-update "${PARAMS[@]}"
done
