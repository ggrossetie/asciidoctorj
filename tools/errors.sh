#!/bin/sh
# Compiles the project and lists the compilation errors with the corresponding source line.
mvn -q -o test-compile 2>&1 | grep -E "^\[ERROR\] /.*\.java" | sort -u | while read -r l; do
  f=$(printf '%s' "$l" | sed -E 's/^\[ERROR\] ([^:]+):\[([0-9]+),.*/\1 \2/'); set -- $f
  printf '%s:%s: %s || %s\n' "$(basename $1)" "$2" "$(printf '%s' "$l" | sed -E 's/^[^]]*\] [^ ]* //')" \
    "$(sed -n ${2}p $1 | sed 's/^ *//' | cut -c1-${WIDTH:-160})"
done
