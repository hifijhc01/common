#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="${1:-templates/eap}"
OUT_DIR="${2:-/workspace/rendered}"

mkdir -p "${OUT_DIR}"

# envsubst로 ${VAR} 치환
shopt -s nullglob
for f in "${SRC_DIR}"/*.yaml; do
  fname="$(basename "$f")"
  envsubst < "$f" > "${OUT_DIR}/${fname}"
done

echo "Rendered to ${OUT_DIR}:"
ls -1 "${OUT_DIR}"
