#!/usr/bin/env bash
# extract_mtk_da_mt6768.sh
#
# Downloads all MTK flash tool archives listed in lmsa_tool_urls.txt and
# extracts every file that relates to the MT6768 chipset: Download Agent
# (DA) binaries, scatter files, SVC helpers, auth/cert files, and any
# other MT6768-tagged artefact.
#
# Usage:
#   ./extract_mtk_da_mt6768.sh [TOOL_URLS_FILE] [OUTPUT_DIR]
#
# Defaults:
#   TOOL_URLS_FILE = lmsa_tool_urls.txt  (tab-separated "URL<TAB>filename")
#   OUTPUT_DIR     = mtk_tools_mt6768
#
# Requirements: bash, curl (or wget), unzip, find

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOL_URLS_FILE="${1:-${SCRIPT_DIR}/lmsa_tool_urls.txt}"
OUTPUT_DIR="${2:-${SCRIPT_DIR}/mtk_tools_mt6768}"

# ── directories ────────────────────────────────────────────────────────────────
ZIP_CACHE="${OUTPUT_DIR}/zips"        # downloaded archives
EXTRACT_DIR="${OUTPUT_DIR}/extracted" # full extractions
DA_DIR="${OUTPUT_DIR}/DA"             # Download Agent binaries
SVC_DIR="${OUTPUT_DIR}/SVC"           # service / SVC files
AUTH_DIR="${OUTPUT_DIR}/Auth"         # auth / cert / RSA files
SCATTER_DIR="${OUTPUT_DIR}/Scatter"   # scatter/partition map files
OTHER_DIR="${OUTPUT_DIR}/Other"       # other MT6768-tagged files

mkdir -p "$ZIP_CACHE" "$EXTRACT_DIR" "$DA_DIR" "$SVC_DIR" \
         "$AUTH_DIR" "$SCATTER_DIR" "$OTHER_DIR"

LOG="${OUTPUT_DIR}/extract_mt6768.log"
: > "$LOG"

log() { echo "[$(date '+%H:%M:%S')] $*" | tee -a "$LOG"; }

# ── helper: download one file ──────────────────────────────────────────────────
download_file() {
    local url="$1" dest="$2"
    [[ -f "$dest" ]] && { log "  (cached) $(basename "$dest")"; return 0; }
    log "  Downloading: $(basename "$dest")"
    if command -v curl &>/dev/null; then
        curl -fsSL --retry 3 -o "$dest" "$url" 2>>"$LOG" || {
            log "  WARNING: curl failed for $(basename "$dest"), skipping"
            rm -f "$dest"; return 1
        }
    elif command -v wget &>/dev/null; then
        wget -q --tries=3 -O "$dest" "$url" 2>>"$LOG" || {
            log "  WARNING: wget failed for $(basename "$dest"), skipping"
            rm -f "$dest"; return 1
        }
    else
        log "ERROR: neither curl nor wget is available"; exit 1
    fi
}

# ── helper: classify and copy an MT6768 file ──────────────────────────────────
collect_file() {
    local src="$1" base
    base="$(basename "$src")"
    local base_lc="${base,,}"   # lowercase for pattern matching

    if [[ "$base_lc" =~ da.*\.bin$|allInOne_da|_da\.bin$|download.agent ]]; then
        cp -n "$src" "$DA_DIR/$base"
        log "    [DA]      $base"
    elif [[ "$base_lc" =~ svc|service ]]; then
        cp -n "$src" "$SVC_DIR/$base"
        log "    [SVC]     $base"
    elif [[ "$base_lc" =~ auth|cert|rsa|\.pem$|\.crt$|\.cer$|\.key$ ]]; then
        cp -n "$src" "$AUTH_DIR/$base"
        log "    [Auth]    $base"
    elif [[ "$base_lc" =~ scatter|partition ]]; then
        cp -n "$src" "$SCATTER_DIR/$base"
        log "    [Scatter] $base"
    else
        cp -n "$src" "$OTHER_DIR/$base"
        log "    [Other]   $base"
    fi
}

# ── main loop ──────────────────────────────────────────────────────────────────
log "=== MTK tools download + MT6768 extraction ==="
log "Tool URL list : $TOOL_URLS_FILE"
log "Output dir    : $OUTPUT_DIR"
log ""

total=0; found_mt6768=0

while IFS=$'\t' read -r url filename; do
    # skip blank lines and comment lines
    [[ -z "$url" || "$url" == \#* ]] && continue

    # only process MTK / SP_Flash_Tool archives
    case "$filename" in
        MTK_*|SP_Flash_Tool*|flash_tool*|Flash_Tool*|Smart_Phone_Flash_Tool*|\
        TN_MTK_*|LamuLiteGo_FlashTool*|Lamu_Flash_Tool*|LamuC_FlashTool*|\
        MTK_SP_Flash_Tool*|PokerPlus_Flash_Tool*|RESEARCHDOWNLOAD*)
            : ;;   # keep
        *)
            continue ;;
    esac

    (( total++ )) || true
    zip_dest="${ZIP_CACHE}/${filename}"

    log "--- $filename"

    download_file "$url" "$zip_dest" || continue

    # extract into a per-archive sub-directory
    extract_subdir="${EXTRACT_DIR}/${filename%.zip}"
    mkdir -p "$extract_subdir"

    if ! unzip -q -o "$zip_dest" -d "$extract_subdir" 2>>"$LOG"; then
        log "  WARNING: unzip failed for $filename, skipping"
        continue
    fi

    # find files that reference MT6768 by name or path
    while IFS= read -r -d '' match; do
        (( found_mt6768++ )) || true
        collect_file "$match"
    done < <(find "$extract_subdir" -type f \
        \( -iname "*MT6768*" -o -iname "*6768*" \) -print0)

    # also look for generic DA/scatter files likely to include MT6768 support
    while IFS= read -r -d '' da_file; do
        local_base="$(basename "$da_file")"
        # avoid duplicating files already collected above
        [[ "$local_base" =~ 6768 ]] && continue
        (( found_mt6768++ )) || true
        collect_file "$da_file"
    done < <(find "$extract_subdir" -type f \
        \( -iname "MTK_AllInOne_DA*" \
           -o -iname "DA_SWSEC*" \
           -o -iname "Preloader_*" \
           -o -iname "*_scatter.txt" \
           -o -iname "*_scatter_emmc.txt" \
           -o -iname "*auth*" \) -print0)

done < "$TOOL_URLS_FILE"

log ""
log "=== Summary ==="
log "MTK tool archives processed : $total"
log "MT6768-related files found  : $found_mt6768"
log "Output directories:"
log "  DA      -> $DA_DIR"
log "  SVC     -> $SVC_DIR"
log "  Auth    -> $AUTH_DIR"
log "  Scatter -> $SCATTER_DIR"
log "  Other   -> $OTHER_DIR"
log "Full log  -> $LOG"
