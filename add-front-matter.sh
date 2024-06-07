#!/bin/bash

# Find all markdown files in the current directory
md_files=($(find ./_*/ -type f -name '*.md'))

# Loop through the markdown files and check if their content starts with ---
for file in "${md_files[@]}"
do
  if ! grep -q "^---" "$file"; then
    echo -e "---\n---\n\n$(cat $file)" > $file
  fi
done
