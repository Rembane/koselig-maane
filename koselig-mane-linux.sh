#!/bin/sh
echo -ne '\033c\033]0;Koselig måne\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/koselig-mane-linux.x86_64" "$@"
