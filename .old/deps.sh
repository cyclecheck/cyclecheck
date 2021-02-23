#!/bin/bash

CWD="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

RAN=false
for FOLDER in $CWD/packages/*; do
  if [[ -d $FOLDER ]] && test -f "$FOLDER/pubspec.yaml"; then
    echo "Getting depedencies in"
    echo "$FOLDER"
    cd $FOLDER
    flutter pub get
    RAN=true
  fi
done

if [[ ! $RAN ]]; then
  echo "No suitable flutter folders were found!"
  exit 1
fi