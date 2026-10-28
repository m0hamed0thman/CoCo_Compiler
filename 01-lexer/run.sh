#!/usr/bin/env bash
# macOS / Linux. On Windows use run.bat
cd "$(dirname "$0")" || exit 1
JJ="${1:-Lexer.jj}"
IN="${2:-test.txt}"
rm -rf build && mkdir build
set -x
java -cp ../javacc.jar javacc -OUTPUT_DIRECTORY=build "$JJ"
javac -d build build/*.java
java -cp build Lexer "$IN"
