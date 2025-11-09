#!/usr/bin/env bash

readarray -t lang_files < <(find langs -maxdepth 1 -type f -name "*.toml")

input_file="main.typ"
output_dir="build"

mkdir -p "$output_dir"

for lang_file in "${lang_files[@]}"; do
    lang="${lang_file##*/}"
    lang="${lang%.toml}"
    output_file="$output_dir/cv-$lang.pdf"
    typst compile "$input_file" --input lang-file="$lang_file" "$output_file"
done
