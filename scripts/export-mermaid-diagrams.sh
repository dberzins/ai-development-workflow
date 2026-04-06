#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="${1:-$SCRIPT_DIR/../diagrams}"
OUTPUT_FORMAT="${2:-png}"
DRY_RUN="${3:-}"

SOURCE_DIR="$(cd "$SOURCE_DIR" && pwd)"

get_mmdc_command() {
    if command -v mmdc &>/dev/null; then
        echo "mmdc"
        return
    fi
    if command -v npx &>/dev/null; then
        echo "npx --yes @mermaid-js/mermaid-cli"
        return
    fi
    echo "Error: Mermaid CLI is not available. Install 'mmdc' globally or install Node.js so the script can use 'npx --yes @mermaid-js/mermaid-cli'." >&2
    exit 1
}

MMDC_CMD="$(get_mmdc_command)"

shopt -s nullglob
FILES=("$SOURCE_DIR"/*.mmd)
shopt -u nullglob

if [[ ${#FILES[@]} -eq 0 ]]; then
    echo "Error: No Mermaid source files were found in '$SOURCE_DIR'." >&2
    exit 1
fi

for f in "${FILES[@]}"; do
    output="${f%.mmd}.$OUTPUT_FORMAT"
    echo "Exporting $(basename "$f") -> $(basename "$output")"

    if [[ "$DRY_RUN" == "--dry-run" ]]; then
        continue
    fi

    $MMDC_CMD -i "$f" -o "$output"
done

echo "Finished exporting ${#FILES[@]} Mermaid diagram(s)."
