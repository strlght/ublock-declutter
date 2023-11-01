#!/usr/bin/env bash

FILTER_FILE=filters/all.txt

[ -f "$FILTER_FILE" ] && rm "$FILTER_FILE"

(
  sed -r "s/^! Last modified:/! Last modified: $(date -Ru)/g" helpers/header.txt
  find filters/ -type f -name '*.txt' -not -name 'all.txt' -print0 | xargs -0 grep -h "^[^!;]" --
) > "$FILTER_FILE"
