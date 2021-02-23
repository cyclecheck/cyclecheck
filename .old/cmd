#!/bin/bash

CWD="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

printUsage() {
    echo "Usage: ./cmd <package> <flutter command>"
    echo
    echo "Run a command in the folder context of a package inside of './packages'."
    echo
    echo "Example:"
    echo "    ./cmd api flutter pub get"
    echo "    ./cmd app flutter run"
}

PACKAGE=$1
shift

if [[ -z "$PACKAGE" ]]; then
    echo "Error: No package was passed in!"
    echo
    printUsage
    exit 1
fi

PACKAGES=()
for FILE in $CWD/packages/*; do
    [[ -d $FILE ]] && PACKAGES+=("$(basename $FILE)")
done

echo "Found these packages: [${PACKAGES[@]}]"

if [[ ! " ${PACKAGES[@]} " =~ " ${PACKAGE} " ]]; then
    echo "Error: '$PACKAGE' was not found in ./packages"
    exit 1
fi

echo "Running $@"
echo "in $CWD/packages/$PACKAGE"
cd $CWD/packages/$PACKAGE
$@
