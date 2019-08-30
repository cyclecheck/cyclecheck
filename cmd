#!/bin/bash

CWD="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

printUsage() {
    echo "Usage: cmd <api|app> <flutter command>"
    echo
    echo "Run a flutter command in the context of a package."
    echo
    echo "Example:"
    echo "    ./command.sh api flutter pub get"
    echo "    ./command.sh app flutter run"
}

PACKAGE=$1
shift

if [[ -z "$PACKAGE" ]]; then
    echo "No package was passed in!"
    echo
    printUsage
    exit 1
fi

if [[ ! "$PACKAGE" = "api" ]] && [[ ! "$PACKAGE" = "app" ]]; then
    echo "Unknown package '$PACKAGE'"
    echo
    printUsage
    exit 1
fi

echo "Running $@"
echo "in $CWD/packages/$PACKAGE"
cd $CWD/packages/$PACKAGE
$@
