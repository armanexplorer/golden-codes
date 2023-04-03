#!/bin/bash

# Get a list of all directories starting with an underscore
directories=($(find . -maxdepth 1 -type d -name '_*' -not -name '_site' -not -name '_layouts' -not -name '_includes' -printf '%f\n'))

# Loop through the directories and add them to the _config.yml file as collections
for dir in "${directories[@]}"
do
  collection=$(echo "$dir" | sed 's/_//')

  if ! grep -q "$collection:" _config.yml; then
    cat <<EOF >> _config.yml
  $collection:
    output: true
    permalink: /:collection/:name
EOF
  fi
done