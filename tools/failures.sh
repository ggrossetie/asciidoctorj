#!/bin/sh
# Lists the failing tests from the surefire reports with the first lines of the failure message.
for f in */target/surefire-reports/*.txt; do
  awk '/<<< (FAILURE|ERROR)!/ && !/^Tests run/ {name=$1; getline m; print name " || " m}' "$f"
done | sed -E 's/^com\.asciidoctor\.//' | cut -c1-${1:-300}
