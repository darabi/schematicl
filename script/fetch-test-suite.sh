#!/bin/bash
# Fetch the official JSON Schema Test Suite at the pinned commit into vendor/.
set -euo pipefail
commit=245a45abc90190c0bff04d97e6d2b541b4bb9f12
dir="$(cd "$(dirname "$0")/.." && pwd)/vendor/JSON-Schema-Test-Suite"
if [ ! -d "$dir/.git" ]; then
    git init -q "$dir"
    git -C "$dir" remote add origin \
        https://github.com/json-schema-org/JSON-Schema-Test-Suite.git
fi
git -C "$dir" fetch -q --depth 1 origin "$commit"
git -C "$dir" checkout -q FETCH_HEAD
