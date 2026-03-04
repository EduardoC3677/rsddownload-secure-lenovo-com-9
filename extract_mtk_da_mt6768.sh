#!/usr/bin/env bash
# extract_mtk_da_mt6768.sh
#
# Downloads every MTK / SP_Flash_Tool archive listed in lmsa_tool_urls.txt,
# fully extracts each one, and additionally collects files relevant to the
# MT6768 chipset (DA binaries, scatter, SVC, auth/cert, …) into dedicated
# sub-directories so they are easy to find and commit to the repository.
#
# Usage:
#   ./extract_mtk_da_mt6768.sh [TOOL_URLS_FILE] [OUTPUT_DIR]
#
# Defaults:
#   TOOL_URLS_FILE = lmsa_tool_urls.txt   (tab-separated "URL<TAB>filename")
#   OUTPUT_DIR     = mtk_tools            (created next to this script)
#
# Requirements: bash ≥ 4, curl (or wget), unzip, find

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOL_URLS_FILE="${1:-${SCRIPT_DIR}/lmsa_tool_urls.txt}"
OUTPUT_DIR="${2:-${SCRIPT_DIR}/mtk_tools}"

# ── output tree ────────────────────────────────────────────────────────────────
ZIP_CACHE="${OUTPUT_DIR}/_zips"          # raw downloaded archives (not committed)
EXTRACT_DIR="${OUTPUT_DIR}/extracted"    # full per-archive extractions
MT6768_DA="${OUTPUT_DIR}/mt6768/DA"      # Download Agent binaries
MT6768_SVC="${OUTPUT_DIR}/mt6768/SVC"    # service helper files
MT6768_AUTH="${OUTPUT_DIR}/mt6768/Auth"  # auth / cert / RSA / key files
MT6768_SCATTER="${OUTPUT_DIR}/mt6768/Scatter"  # scatter / partition-map files
MT6768_OTHER="${OUTPUT_DIR}/mt6768/Other"      # other MT6768-tagged artefacts

mkdir -p "$ZIP_CACHE" "$EXTRACT_DIR" \
         "$MT6768_DA" "$MT6768_SVC" "$MT6768_AUTH" \
         "$MT6768_SCATTER" "$MT6768_OTHER"

LOG="${OUTPUT_DIR}/extract_mtk.log"
: > "$LOG"

log()  { echo "[$(date '+%H:%M:%S')] $*" | tee -a "$LOG"; }
warn() { echo "[$(date '+%H:%M:%S')] WARNING: $*" | tee -a "$LOG" >&2; }

# ── helper: download one URL to a destination path ────────────────────────────
download_file() {
    local url="$1" dest="$2"
    if [[ -s "$dest" ]]; then
        log "  (cached) $(basename "$dest")"
        return 0
    fi
    log "  Downloading: $(basename "$dest")"
    if command -v curl &>/dev/null; then
        curl -fsSL --retry 3 --retry-delay 5 -o "$dest" "$url" 2>>"$LOG" || {
            warn "curl failed for $(basename "$dest"), skipping"
            rm -f "$dest"; return 1
        }
    elif command -v wget &>/dev/null; then
        wget -q --tries=3 -O "$dest" "$url" 2>>"$LOG" || {
            warn "wget failed for $(basename "$dest"), skipping"
            rm -f "$dest"; return 1
        }
    else
        echo "ERROR: neither curl nor wget found" >&2; exit 1
    fi
}

# ── helper: classify and copy an MT6768-related file into the right bucket ─────
collect_mt6768_file() {
    local src="$1"
    local base; base="$(basename "$src")"
    local lc="${base,,}"

    local dest_dir
    if   [[ "$lc" =~ da[._-].*\.bin$|allinone_da|_da\.bin$|download.agent|da_swsec ]]; then
        dest_dir="$MT6768_DA"
    elif [[ "$lc" =~ svc|service ]]; then
        dest_dir="$MT6768_SVC"
    elif [[ "$lc" =~ auth|cert|rsa|\.pem$|\.crt$|\.cer$|\.key$|\.p12$|\.pfx$ ]]; then
        dest_dir="$MT6768_AUTH"
    elif [[ "$lc" =~ scatter|partition_table|ptable ]]; then
        dest_dir="$MT6768_SCATTER"
    else
        dest_dir="$MT6768_OTHER"
    fi

    local tag; tag="$(basename "$dest_dir")"
    if cp -n "$src" "${dest_dir}/${base}" 2>/dev/null; then
        log "    [${tag}] $base"
    else
        log "    [${tag}] $base  (duplicate, skipped)"
    fi
}

# ── main loop ──────────────────────────────────────────────────────────────────
log "================================================================="
log " MTK tools: full extraction + MT6768 artefact collection"
log "================================================================="
log " URL list  : $TOOL_URLS_FILE"
log " Output    : $OUTPUT_DIR"
log ""

total_archives=0
total_extracted=0
total_mt6768=0

while IFS=$'\t' read -r url filename; do
    # skip blank lines and comment lines
    [[ -z "$url" || "$url" == \#* ]] && continue

    # ── only process MTK / SP_Flash_Tool archives ────────────────────────────
    case "$filename" in
        MTK_*|SP_Flash_Tool*|flash_tool*|Flash_Tool*|Smart_Phone_Flash_Tool*|\
        TN_MTK_*|LamuLiteGo_FlashTool*|Lamu_Flash_Tool*|LamuC_FlashTool*|\
        MTK_SP_Flash_Tool*|PokerPlus_Flash_Tool*|RESEARCHDOWNLOAD*)
            ;;   # keep and process
        *)
            continue ;;
    esac

    (( total_archives++ )) || true
    zip_dest="${ZIP_CACHE}/${filename}"
    log "--- [$total_archives] $filename"

    download_file "$url" "$zip_dest" || continue

    # ── full extraction into per-archive sub-directory ───────────────────────
    tool_name="${filename%.zip}"
    extract_subdir="${EXTRACT_DIR}/${tool_name}"
    mkdir -p "$extract_subdir"

    if ! unzip -q -o "$zip_dest" -d "$extract_subdir" 2>>"$LOG"; then
        warn "unzip failed for $filename, skipping extraction"
        continue
    fi
    (( total_extracted++ )) || true
    log "  Extracted to: ${extract_subdir##$SCRIPT_DIR/}"

    # ── collect files with explicit MT6768 / 6768 in their name ─────────────
    while IFS= read -r -d '' f; do
        collect_mt6768_file "$f"
        (( total_mt6768++ )) || true
    done < <(find "$extract_subdir" -type f \
                  \( -iname "*MT6768*" -o -iname "*6768*" \) -print0)

    # ── collect generic DA / scatter / auth files (chipset-agnostic names) ───
    # These files from every flash tool version are included because they may
    # contain MT6768 support internally even when the name does not say so.
    while IFS= read -r -d '' f; do
        b="$(basename "$f")"
        # skip if already captured by the 6768 search above
        [[ "${b,,}" =~ 6768 ]] && continue
        collect_mt6768_file "$f"
        (( total_mt6768++ )) || true
    done < <(find "$extract_subdir" -type f \( \
                  -iname "MTK_AllInOne_DA*.bin"  \
               -o -iname "DA_SWSEC*.bin"          \
               -o -iname "Preloader_MT*.bin"       \
               -o -iname "*_scatter.txt"         \
               -o -iname "*_scatter_emmc.txt"    \
               -o -iname "*_scatter_nand.txt"    \
               -o -iname "auth_sv5.auth"         \
               -o -iname "*.auth"                \
               -o -iname "*_SVC*"                \
               \) -print0)

done < "$TOOL_URLS_FILE"

log ""
log "================================================================="
log " Summary"
log "================================================================="
log " MTK archives found in list : $total_archives"
log " Archives successfully unzipped : $total_extracted"
log " MT6768-related files collected : $total_mt6768"
log ""
log " Output tree:"
log "   Full extractions -> $EXTRACT_DIR"
log "   MT6768 / DA      -> $MT6768_DA"
log "   MT6768 / SVC     -> $MT6768_SVC"
log "   MT6768 / Auth    -> $MT6768_AUTH"
log "   MT6768 / Scatter -> $MT6768_SCATTER"
log "   MT6768 / Other   -> $MT6768_OTHER"
log " Full log            -> $LOG"
