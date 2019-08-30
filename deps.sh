#!/bin/bash

CWD="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

cd $CWD/packages/api
flutter pub get

cd $CWD/packages/app
flutter pub get