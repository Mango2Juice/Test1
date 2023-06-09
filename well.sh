#!/usr/bin/env bash
set -euo pipefail

destination="${@:$#}"  # last argument
sources="${@:1:$#-1}"  # exclude the last argument

if [ -s "${destination}" ]; then
  rm -f -- "${destination}"
fi

for source in ${sources}
do
  cat "${source}" >> "${destination}"
  
  # Empty line to separate doctest code at end of the file
  # from contents of the next file.
  echo "" >> "${destination}"
done