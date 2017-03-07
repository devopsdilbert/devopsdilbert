#!/bin/bash

# not pretty, but does the job
function format_mxlibrary() {
    fn=$1; shift
    grep -q '<mxlibrary>' "$fn" || return 1

    tmp="${fn}.tmp"
    echo '<mxlibrary>' > "$tmp"
    sed -e '1h;2,$H;$!d;g' -e 's/<mxlibrary>\(.*\)<\/mxlibrary>/\1/' "$fn" | jq -M . >> "$tmp"
    echo '</mxlibrary>' >> "$tmp"

    mv "$fn" "${fn}.orig"
    mv "$tmp" "$fn"
}

if [[ $# -gt 0 ]]; then
    for fn in "$@"; do
        format_mxlibrary "$fn"
    done
else
    find . -type f -iname "*.xml" -print0 | while IFS= read -r -d $'\0' fn; do
        format_mxlibrary "$fn"
    done
fi
