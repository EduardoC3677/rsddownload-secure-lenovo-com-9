#!/usr/bin/env bash
set -euo pipefail
# ============================================================
# Flash Tools — DA Agents, Preloaders, SLA-Challenge,
# Certificates, Keys & Auth — ALL Processors / ALL Devices
# ============================================================
# This script downloads every flash tool available on
# rsddownload-secure.lenovo.com regardless of processor family.
#
# CONTENTS BY CATEGORY:
#  MTK / SP Flash Tool base     — contain DA agent binaries &
#                                 preloader.bin inside the ZIP
#  MTK SVC variants             — service mode: DA auth + key
#  MTK Auth/RSA variants        — DA auth file, cert & RSA key
#  MTK Parsely (DA signing)     — DA signing tools (all devices)
#  QCOM QFil base               — contain sla-challenge.dll &
#                                 Qualcomm prog_* preloaders
#  QCOM QFil SVC               — service auth + cert inside
#  QCOM WithDLL                 — explicit DLL bundle (includes
#                                 sla-challenge.dll)
#  Unisoc UpgradeDownload/RD   — SPRD upgrade tool (service auth)
#  Unisoc PAC Tool             — PAC format, cert + key inside
# ============================================================
#
# CREDENTIALS
#  The Bearer token and guid below are the LMSA session values
#  captured during the crawl. Override them at runtime via:
#    LMSA_TOKEN=<token> LMSA_GUID=<guid> bash flash_tools_da_agents_all_processors.sh
#
_TOKEN="${LMSA_TOKEN:-bONrarPxyT9hNbLGoktfWJvRHXy59HQWaaxlYAKptU/8ZqWIQYGmBYfEnkR3HDlsMXaeYur/Wb6FCIeNkyIhPd1nkuioOVEXBDYxfu4lkAnprLXMRF4eTWP1Gbh9pyvVLp40t/ydYtfs1SQN9Dlc0bz7nWHn6PPL1LU1mD1wxco6LuhF6WiLdn+6eyBKCrolf3r2S6hJ5LJgJsvBfbULz1fMSWXBJdWTIpwIO4pQX5MKx5E58HbXWZYVCX/PkVEKh7i2VJD5j9yeZ8DiccuBfx/jzaVkauNbS+5TSjqvjeanMNL8R62OvS8s5fkDuwTbrYzGS+mHXx3nHg2uRa8RqQ==}"
_GUID="${LMSA_GUID:-3adf1304-8a70-4352-b687-8eddcef6b7d1}"
# ============================================================

# ──────────────────────────────────────────────────────────────────────────────
# MTK / SP Flash Tool — Base (contains DA agent .bin + preloader.bin)
# ──────────────────────────────────────────────────────────────────────────────

# https://download.lenovo.com/lsa/Resource/Tools/Flash_Tool_TB-8304F.zip
curl -L -o 'Flash_Tool_TB-8304F.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/Flash_Tool_TB-8304F.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'Flash_Tool_TB-8304F.zip' 'https://download.lenovo.com/lsa/Resource/Tools/Flash_Tool_TB-8304F.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/Flash_Tool_V5.0.1_Penang.zip
curl -L -o 'Flash_Tool_V5.0.1_Penang.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/Flash_Tool_V5.0.1_Penang.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'Flash_Tool_V5.0.1_Penang.zip' 'https://download.lenovo.com/lsa/Resource/Tools/Flash_Tool_V5.0.1_Penang.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://rsddownload-secure.lenovo.com/LamuC_FlashTool_Console_LMSA_5.2404.03_release.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032129Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=80cf27ffcf2b712147f1ad5cab0a5a4f605e542a4ab5875db976cc7322f51332
curl -L -o 'LamuC_FlashTool_Console_LMSA_5.2404.03_release.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/LamuC_FlashTool_Console_LMSA_5.2404.03_release.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032129Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=80cf27ffcf2b712147f1ad5cab0a5a4f605e542a4ab5875db976cc7322f51332'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'LamuC_FlashTool_Console_LMSA_5.2404.03_release.zip' 'https://rsddownload-secure.lenovo.com/LamuC_FlashTool_Console_LMSA_5.2404.03_release.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032129Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=80cf27ffcf2b712147f1ad5cab0a5a4f605e542a4ab5875db976cc7322f51332'

# ──────────────────────────────────────────────────────────────────────────────


# https://rsddownload-secure.lenovo.com/LamuLiteGo_FlashTool_Console_LMSA_5.2404.04_Release.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032128Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=a042024ebf21a1cd04485cbbab13c79f6f3e03f7f0f4baf211d566ff2a4014f5
curl -L -o 'LamuLiteGo_FlashTool_Console_LMSA_5.2404.04_Release.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/LamuLiteGo_FlashTool_Console_LMSA_5.2404.04_Release.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032128Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=a042024ebf21a1cd04485cbbab13c79f6f3e03f7f0f4baf211d566ff2a4014f5'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'LamuLiteGo_FlashTool_Console_LMSA_5.2404.04_Release.zip' 'https://rsddownload-secure.lenovo.com/LamuLiteGo_FlashTool_Console_LMSA_5.2404.04_Release.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032128Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=a042024ebf21a1cd04485cbbab13c79f6f3e03f7f0f4baf211d566ff2a4014f5'

# ──────────────────────────────────────────────────────────────────────────────


# https://rsddownload-secure.lenovo.com/Lamu_Flash_Tool_Console_LMSA_5.2404.03_Release1.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032129Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=1b7a2954b54067c88316f08d8cee9442453a24cb80dc107c0a27cb81757d0e97
curl -L -o 'Lamu_Flash_Tool_Console_LMSA_5.2404.03_Release1.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/Lamu_Flash_Tool_Console_LMSA_5.2404.03_Release1.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032129Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=1b7a2954b54067c88316f08d8cee9442453a24cb80dc107c0a27cb81757d0e97'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'Lamu_Flash_Tool_Console_LMSA_5.2404.03_Release1.zip' 'https://rsddownload-secure.lenovo.com/Lamu_Flash_Tool_Console_LMSA_5.2404.03_Release1.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032129Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=1b7a2954b54067c88316f08d8cee9442453a24cb80dc107c0a27cb81757d0e97'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/TAB/MTK_Flash_Tool_Asha.zip
curl -L -o 'MTK_Flash_Tool_Asha.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/TAB/MTK_Flash_Tool_Asha.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_Flash_Tool_Asha.zip' 'https://download.lenovo.com/lsa/Resource/Tools/TAB/MTK_Flash_Tool_Asha.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_Tool_V5.2052_YT-J706.zip
curl -L -o 'MTK_Flash_Tool_V5.2052_YT-J706.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_Tool_V5.2052_YT-J706.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_Flash_Tool_V5.2052_YT-J706.zip' 'https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_Tool_V5.2052_YT-J706.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_Tool_v5.1916.zip
curl -L -o 'MTK_Flash_Tool_v5.1916.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_Tool_v5.1916.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_Flash_Tool_v5.1916.zip' 'https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_Tool_v5.1916.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/TAB/MTK_Flash_Tool_v5.2052_8506.zip
curl -L -o 'MTK_Flash_Tool_v5.2052_8506.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/TAB/MTK_Flash_Tool_v5.2052_8506.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_Flash_Tool_v5.2052_8506.zip' 'https://download.lenovo.com/lsa/Resource/Tools/TAB/MTK_Flash_Tool_v5.2052_8506.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://rsddownload-secure.lenovo.com/MTK_Flash_Tool_v5.2104_P522.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033641Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=e51718a05a9d6ba77a4f26ea14eecdd3bb49cca779860c3dfade1266155db7d4
curl -L -o 'MTK_Flash_Tool_v5.2104_P522.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/MTK_Flash_Tool_v5.2104_P522.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033641Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=e51718a05a9d6ba77a4f26ea14eecdd3bb49cca779860c3dfade1266155db7d4'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_Flash_Tool_v5.2104_P522.zip' 'https://rsddownload-secure.lenovo.com/MTK_Flash_Tool_v5.2104_P522.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033641Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=e51718a05a9d6ba77a4f26ea14eecdd3bb49cca779860c3dfade1266155db7d4'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_Tool_v5.2104_TB-J616.zip
curl -L -o 'MTK_Flash_Tool_v5.2104_TB-J616.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_Tool_v5.2104_TB-J616.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_Flash_Tool_v5.2104_TB-J616.zip' 'https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_Tool_v5.2104_TB-J616.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/V1/MTK_Flash_tool_V5.2036.zip
curl -L -o 'MTK_Flash_tool_V5.2036.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/V1/MTK_Flash_tool_V5.2036.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_Flash_tool_V5.2036.zip' 'https://download.lenovo.com/lsa/Resource/Tools/V1/MTK_Flash_tool_V5.2036.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_tool_v5.1920.00.001_V1.zip
curl -L -o 'MTK_Flash_tool_v5.1920.00.001_V1.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_tool_v5.1920.00.001_V1.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_Flash_tool_v5.1920.00.001_V1.zip' 'https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_tool_v5.1920.00.001_V1.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_tool_v5.1920.00.001_V1_update.zip
curl -L -o 'MTK_Flash_tool_v5.1920.00.001_V1_update.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_tool_v5.1920.00.001_V1_update.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_Flash_tool_v5.1920.00.001_V1_update.zip' 'https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_tool_v5.1920.00.001_V1_update.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_tool_v5.1920.00.001_V2.zip
curl -L -o 'MTK_Flash_tool_v5.1920.00.001_V2.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_tool_v5.1920.00.001_V2.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_Flash_tool_v5.1920.00.001_V2.zip' 'https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_tool_v5.1920.00.001_V2.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/V1/MTK_SP_Flash_Tool_V5_TB370.zip
curl -L -o 'MTK_SP_Flash_Tool_V5_TB370.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/V1/MTK_SP_Flash_Tool_V5_TB370.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_SP_Flash_Tool_V5_TB370.zip' 'https://download.lenovo.com/lsa/Resource/Tools/V1/MTK_SP_Flash_Tool_V5_TB370.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/MTK_SP_Flash_Tool_V5_TB370_V1.zip
curl -L -o 'MTK_SP_Flash_Tool_V5_TB370_V1.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/MTK_SP_Flash_Tool_V5_TB370_V1.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_SP_Flash_Tool_V5_TB370_V1.zip' 'https://download.lenovo.com/lsa/Resource/Tools/MTK_SP_Flash_Tool_V5_TB370_V1.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/MTK_flash_tool_V6.zip
curl -L -o 'MTK_flash_tool_V6.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/MTK_flash_tool_V6.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_flash_tool_V6.zip' 'https://download.lenovo.com/lsa/Resource/Tools/MTK_flash_tool_V6.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/MTK_flash_tool_V6_TB351.zip
curl -L -o 'MTK_flash_tool_V6_TB351.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/MTK_flash_tool_V6_TB351.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_flash_tool_V6_TB351.zip' 'https://download.lenovo.com/lsa/Resource/Tools/MTK_flash_tool_V6_TB351.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/MTK_flashtool_v5.1616.00.000.zip
curl -L -o 'MTK_flashtool_v5.1616.00.000.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/MTK_flashtool_v5.1616.00.000.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_flashtool_v5.1616.00.000.zip' 'https://download.lenovo.com/lsa/Resource/Tools/MTK_flashtool_v5.1616.00.000.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/PokerPlus_Flash_Tool_S1916.V1848.1.zip
curl -L -o 'PokerPlus_Flash_Tool_S1916.V1848.1.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/PokerPlus_Flash_Tool_S1916.V1848.1.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'PokerPlus_Flash_Tool_S1916.V1848.1.zip' 'https://download.lenovo.com/lsa/Resource/Tools/PokerPlus_Flash_Tool_S1916.V1848.1.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1628_M3.zip
curl -L -o 'SP_Flash_Tool_5.1628_M3.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1628_M3.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_5.1628_M3.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1628_M3.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1640_M1.zip
curl -L -o 'SP_Flash_Tool_5.1640_M1.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1640_M1.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_5.1640_M1.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1640_M1.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1644_Lacrosse.zip
curl -L -o 'SP_Flash_Tool_5.1644_Lacrosse.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1644_Lacrosse.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_5.1644_Lacrosse.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1644_Lacrosse.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1652_M1.zip
curl -L -o 'SP_Flash_Tool_5.1652_M1.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1652_M1.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_5.1652_M1.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1652_M1.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1652_M2.zip
curl -L -o 'SP_Flash_Tool_5.1652_M2.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1652_M2.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_5.1652_M2.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1652_M2.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1652_TB3-710.zip
curl -L -o 'SP_Flash_Tool_5.1652_TB3-710.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1652_TB3-710.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_5.1652_TB3-710.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1652_TB3-710.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1652_TB3-850.zip
curl -L -o 'SP_Flash_Tool_5.1652_TB3-850.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1652_TB3-850.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_5.1652_TB3-850.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1652_TB3-850.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1820_M1.zip
curl -L -o 'SP_Flash_Tool_5.1820_M1.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1820_M1.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_5.1820_M1.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_5.1820_M1.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_TB-7304F_CMB.zip
curl -L -o 'SP_Flash_Tool_TB-7304F_CMB.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_TB-7304F_CMB.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_TB-7304F_CMB.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_TB-7304F_CMB.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_TB-7304F_NEW.zip
curl -L -o 'SP_Flash_Tool_TB-7304F_NEW.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_TB-7304F_NEW.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_TB-7304F_NEW.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_TB-7304F_NEW.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_TB-7304IX.zip
curl -L -o 'SP_Flash_Tool_TB-7304IX.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_TB-7304IX.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_TB-7304IX.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_TB-7304IX.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_TB336.zip
curl -L -o 'SP_Flash_Tool_TB336.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_TB336.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_TB336.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_TB336.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V2.zip
curl -L -o 'SP_Flash_Tool_V2.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V2.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_V2.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V2.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5.1652_TB-7504.zip
curl -L -o 'SP_Flash_Tool_V5.1652_TB-7504.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5.1652_TB-7504.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_V5.1652_TB-7504.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5.1652_TB-7504.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5.1804_PB2-650_670.zip
curl -L -o 'SP_Flash_Tool_V5.1804_PB2-650_670.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5.1804_PB2-650_670.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_V5.1804_PB2-650_670.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5.1804_PB2-650_670.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5.24_TB305.zip
curl -L -o 'SP_Flash_Tool_V5.24_TB305.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5.24_TB305.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_V5.24_TB305.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5.24_TB305.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5.24_TB311.zip
curl -L -o 'SP_Flash_Tool_V5.24_TB311.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5.24_TB311.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_V5.24_TB311.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5.24_TB311.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5_20240829_OTA15.zip
curl -L -o 'SP_Flash_Tool_V5_20240829_OTA15.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5_20240829_OTA15.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_V5_20240829_OTA15.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5_20240829_OTA15.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5_LTE.zip
curl -L -o 'SP_Flash_Tool_V5_LTE.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5_LTE.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_V5_LTE.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5_LTE.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://rsddownload-secure.lenovo.com/SP_Flash_Tool_V5_MSC_20230809.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033230Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=214ba2ec8bc82e54b7506436cfa3866d6d50de097550402753b07a1fa2825fcd
curl -L -o 'SP_Flash_Tool_V5_MSC_20230809.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/SP_Flash_Tool_V5_MSC_20230809.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033230Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=214ba2ec8bc82e54b7506436cfa3866d6d50de097550402753b07a1fa2825fcd'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_V5_MSC_20230809.zip' 'https://rsddownload-secure.lenovo.com/SP_Flash_Tool_V5_MSC_20230809.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033230Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=214ba2ec8bc82e54b7506436cfa3866d6d50de097550402753b07a1fa2825fcd'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5_TB330_POGOPIN.zip
curl -L -o 'SP_Flash_Tool_V5_TB330_POGOPIN.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5_TB330_POGOPIN.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_V5_TB330_POGOPIN.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5_TB330_POGOPIN.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5_Wifi.zip
curl -L -o 'SP_Flash_Tool_V5_Wifi.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5_Wifi.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_V5_Wifi.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V5_Wifi.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V6_TB373.zip
curl -L -o 'SP_Flash_Tool_V6_TB373.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V6_TB373.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_V6_TB373.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_V6_TB373.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_XT1700XT1706.zip
curl -L -o 'SP_Flash_Tool_XT1700XT1706.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_XT1700XT1706.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_XT1700XT1706.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_XT1700XT1706.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_exe_A1010a20.zip
curl -L -o 'SP_Flash_Tool_exe_A1010a20.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_exe_A1010a20.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_exe_A1010a20.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_exe_A1010a20.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_exe_Windows_A2016.zip
curl -L -o 'SP_Flash_Tool_exe_Windows_A2016.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_exe_Windows_A2016.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_exe_Windows_A2016.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_exe_Windows_A2016.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_exe_Windows_v5.1804_TB3-730.zip
curl -L -o 'SP_Flash_Tool_exe_Windows_v5.1804_TB3-730.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_exe_Windows_v5.1804_TB3-730.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_exe_Windows_v5.1804_TB3-730.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_exe_Windows_v5.1804_TB3-730.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://rsddownload-secure.lenovo.com/SP_Flash_Tool_exe_Windows_v5.1920.00.001.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033117Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=baa39cd6bfaa805ed0971a89ae27e59d31cbd8ee649668483299197a3bea6677
curl -L -o 'SP_Flash_Tool_exe_Windows_v5.1920.00.001.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/SP_Flash_Tool_exe_Windows_v5.1920.00.001.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033117Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=baa39cd6bfaa805ed0971a89ae27e59d31cbd8ee649668483299197a3bea6677'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_exe_Windows_v5.1920.00.001.zip' 'https://rsddownload-secure.lenovo.com/SP_Flash_Tool_exe_Windows_v5.1920.00.001.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033117Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=baa39cd6bfaa805ed0971a89ae27e59d31cbd8ee649668483299197a3bea6677'

# ──────────────────────────────────────────────────────────────────────────────


# https://rsddownload-secure.lenovo.com/SP_Flash_Tool_exe_Windows_v5.1928.01_190906.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032100Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=528a98a80be2a35a738fac9ece437c8f8c8b1dd0e1652a6df0c2cc069160e049
curl -L -o 'SP_Flash_Tool_exe_Windows_v5.1928.01_190906.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/SP_Flash_Tool_exe_Windows_v5.1928.01_190906.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032100Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=528a98a80be2a35a738fac9ece437c8f8c8b1dd0e1652a6df0c2cc069160e049'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_exe_Windows_v5.1928.01_190906.zip' 'https://rsddownload-secure.lenovo.com/SP_Flash_Tool_exe_Windows_v5.1928.01_190906.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032100Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=528a98a80be2a35a738fac9ece437c8f8c8b1dd0e1652a6df0c2cc069160e049'

# ──────────────────────────────────────────────────────────────────────────────


# https://rsddownload-secure.lenovo.com/SP_Flash_Tool_exe_Windows_v5.1928.01_191217.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032100Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=6688c860c81d0d3b1e363fdba513dd03d0efa92999ac72e1249595e1c52004f0
curl -L -o 'SP_Flash_Tool_exe_Windows_v5.1928.01_191217.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/SP_Flash_Tool_exe_Windows_v5.1928.01_191217.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032100Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=6688c860c81d0d3b1e363fdba513dd03d0efa92999ac72e1249595e1c52004f0'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_exe_Windows_v5.1928.01_191217.zip' 'https://rsddownload-secure.lenovo.com/SP_Flash_Tool_exe_Windows_v5.1928.01_191217.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032100Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=6688c860c81d0d3b1e363fdba513dd03d0efa92999ac72e1249595e1c52004f0'

# ──────────────────────────────────────────────────────────────────────────────


# https://rsddownload-secure.lenovo.com/SP_Flash_Tool_exe_Windows_v6.20240517_XT2055.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033202Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=64ef7faeee3a03d6c9daf5c4b528268b6a55ab699487a5c5392ceb47cf52a1f1
curl -L -o 'SP_Flash_Tool_exe_Windows_v6.20240517_XT2055.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/SP_Flash_Tool_exe_Windows_v6.20240517_XT2055.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033202Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=64ef7faeee3a03d6c9daf5c4b528268b6a55ab699487a5c5392ceb47cf52a1f1'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_exe_Windows_v6.20240517_XT2055.zip' 'https://rsddownload-secure.lenovo.com/SP_Flash_Tool_exe_Windows_v6.20240517_XT2055.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033202Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=64ef7faeee3a03d6c9daf5c4b528268b6a55ab699487a5c5392ceb47cf52a1f1'

# ──────────────────────────────────────────────────────────────────────────────


# https://rsddownload-secure.lenovo.com/Smart_Phone_Flash_Tool_For_After_Sale_P410_V3.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032121Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=1fb4ce11e686582d0776a0f8867cef06677233c464c8eeddfb68e95d51729d0a
curl -L -o 'Smart_Phone_Flash_Tool_For_After_Sale_P410_V3.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/Smart_Phone_Flash_Tool_For_After_Sale_P410_V3.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032121Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=1fb4ce11e686582d0776a0f8867cef06677233c464c8eeddfb68e95d51729d0a'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'Smart_Phone_Flash_Tool_For_After_Sale_P410_V3.zip' 'https://rsddownload-secure.lenovo.com/Smart_Phone_Flash_Tool_For_After_Sale_P410_V3.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032121Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=1fb4ce11e686582d0776a0f8867cef06677233c464c8eeddfb68e95d51729d0a'

# ──────────────────────────────────────────────────────────────────────────────


# https://rsddownload-secure.lenovo.com/flash_tool_v5.20230809.00.001.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032142Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=83948521e48d771bd1cfa819d5f3b53b3703f60c983a549c877110137719611f
curl -L -o 'flash_tool_v5.20230809.00.001.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/flash_tool_v5.20230809.00.001.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032142Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=83948521e48d771bd1cfa819d5f3b53b3703f60c983a549c877110137719611f'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'flash_tool_v5.20230809.00.001.zip' 'https://rsddownload-secure.lenovo.com/flash_tool_v5.20230809.00.001.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032142Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=83948521e48d771bd1cfa819d5f3b53b3703f60c983a549c877110137719611f'

# ──────────────────────────────────────────────────────────────────────────────


# ──────────────────────────────────────────────────────────────────────────────
# MTK / SP Flash Tool — SVC Variants (service DA auth + key)
# ──────────────────────────────────────────────────────────────────────────────

# https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_Tool_Asha_SVC.zip
curl -L -o 'MTK_Flash_Tool_Asha_SVC.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_Tool_Asha_SVC.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_Flash_Tool_Asha_SVC.zip' 'https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_Tool_Asha_SVC.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_Tool_TB132FU_SVC.zip
curl -L -o 'MTK_Flash_Tool_TB132FU_SVC.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_Tool_TB132FU_SVC.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_Flash_Tool_TB132FU_SVC.zip' 'https://download.lenovo.com/lsa/Resource/Tools/MTK_Flash_Tool_TB132FU_SVC.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/MTK_flash_tool_V6_SVC.zip
curl -L -o 'MTK_flash_tool_V6_SVC.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/MTK_flash_tool_V6_SVC.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_flash_tool_V6_SVC.zip' 'https://download.lenovo.com/lsa/Resource/Tools/MTK_flash_tool_V6_SVC.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_TB-7304IX_SVC.zip
curl -L -o 'SP_Flash_Tool_TB-7304IX_SVC.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_TB-7304IX_SVC.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_TB-7304IX_SVC.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_TB-7304IX_SVC.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_exe_Windows_v5.1804_TB3-730_SVC.zip
curl -L -o 'SP_Flash_Tool_exe_Windows_v5.1804_TB3-730_SVC.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_exe_Windows_v5.1804_TB3-730_SVC.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_exe_Windows_v5.1804_TB3-730_SVC.zip' 'https://download.lenovo.com/lsa/Resource/Tools/SP_Flash_Tool_exe_Windows_v5.1804_TB3-730_SVC.zip'

# ──────────────────────────────────────────────────────────────────────────────


# ──────────────────────────────────────────────────────────────────────────────
# MTK / SP Flash Tool — Auth / RSA Variants (DA auth cert + RSA key)
# ──────────────────────────────────────────────────────────────────────────────

# https://rsddownload-secure.lenovo.com/SP_Flash_Tool_5.1644_Lacrosse_Auth.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T042231Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=6021bbc90a38a6388f266319653ecf48b8e67dbed9ac0dc206007bfc4c48b171
curl -L -o 'SP_Flash_Tool_5.1644_Lacrosse_Auth.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/SP_Flash_Tool_5.1644_Lacrosse_Auth.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T042231Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=6021bbc90a38a6388f266319653ecf48b8e67dbed9ac0dc206007bfc4c48b171'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'SP_Flash_Tool_5.1644_Lacrosse_Auth.zip' 'https://rsddownload-secure.lenovo.com/SP_Flash_Tool_5.1644_Lacrosse_Auth.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T042231Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=6021bbc90a38a6388f266319653ecf48b8e67dbed9ac0dc206007bfc4c48b171'

# ──────────────────────────────────────────────────────────────────────────────


# https://rsddownload-secure.lenovo.com/TN_MTK_TSDC_FlashTool_V5.2316.11_RSA_V9_Win10_11.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032122Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=601f934b5c89c41100cd8a08ba73230a66a4c4e7f23ab8a35ec9c3d3f17a5799
curl -L -o 'TN_MTK_TSDC_FlashTool_V5.2316.11_RSA_V9_Win10_11.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/TN_MTK_TSDC_FlashTool_V5.2316.11_RSA_V9_Win10_11.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032122Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=601f934b5c89c41100cd8a08ba73230a66a4c4e7f23ab8a35ec9c3d3f17a5799'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'TN_MTK_TSDC_FlashTool_V5.2316.11_RSA_V9_Win10_11.zip' 'https://rsddownload-secure.lenovo.com/TN_MTK_TSDC_FlashTool_V5.2316.11_RSA_V9_Win10_11.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032122Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=601f934b5c89c41100cd8a08ba73230a66a4c4e7f23ab8a35ec9c3d3f17a5799'

# ──────────────────────────────────────────────────────────────────────────────


# ──────────────────────────────────────────────────────────────────────────────
# MTK Parsely — DA Signing Tool (DA agent for all MTK devices)
# ──────────────────────────────────────────────────────────────────────────────

# https://download.lenovo.com/lsa/Resource/Tools/MTK_V5_ParselyRefresh_V1.zip
curl -L -o 'MTK_V5_ParselyRefresh_V1.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/MTK_V5_ParselyRefresh_V1.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_V5_ParselyRefresh_V1.zip' 'https://download.lenovo.com/lsa/Resource/Tools/MTK_V5_ParselyRefresh_V1.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/MTK_V5_Parsely_V1.zip
curl -L -o 'MTK_V5_Parsely_V1.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/MTK_V5_Parsely_V1.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'MTK_V5_Parsely_V1.zip' 'https://download.lenovo.com/lsa/Resource/Tools/MTK_V5_Parsely_V1.zip'

# ──────────────────────────────────────────────────────────────────────────────


# ──────────────────────────────────────────────────────────────────────────────
# Qualcomm QFil — Base (contains sla-challenge.dll + prog_* preloaders)
# ──────────────────────────────────────────────────────────────────────────────

# https://rsddownload-secure.lenovo.com/QFIL_V2.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T042316Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=5e3642af6747d05ca09fd000a244c81c659c59504ad968fdcce13e4009b48a4b
curl -L -o 'QFIL_V2.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/QFIL_V2.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T042316Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=5e3642af6747d05ca09fd000a244c81c659c59504ad968fdcce13e4009b48a4b'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'QFIL_V2.zip' 'https://rsddownload-secure.lenovo.com/QFIL_V2.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T042316Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=5e3642af6747d05ca09fd000a244c81c659c59504ad968fdcce13e4009b48a4b'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/TAB/QFil-V3.zip
curl -L -o 'QFil-V3.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/TAB/QFil-V3.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'QFil-V3.zip' 'https://download.lenovo.com/lsa/Resource/Tools/TAB/QFil-V3.zip'

# ──────────────────────────────────────────────────────────────────────────────


# https://download.lenovo.com/lsa/Resource/Tools/QFil.zip
curl -L -o 'QFil.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/QFil.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'QFil.zip' 'https://download.lenovo.com/lsa/Resource/Tools/QFil.zip'

# ──────────────────────────────────────────────────────────────────────────────


# ──────────────────────────────────────────────────────────────────────────────
# Qualcomm QFil — SVC Variant (service auth + certificate inside)
# ──────────────────────────────────────────────────────────────────────────────

# https://rsddownload-secure.lenovo.com/QFil_SVC.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T042155Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=4d8724630e3c468b3b2969508de971fa4520638f5f22e807c48da3d8de53199f
curl -L -o 'QFil_SVC.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/QFil_SVC.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T042155Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=4d8724630e3c468b3b2969508de971fa4520638f5f22e807c48da3d8de53199f'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'QFil_SVC.zip' 'https://rsddownload-secure.lenovo.com/QFil_SVC.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T042155Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=4d8724630e3c468b3b2969508de971fa4520638f5f22e807c48da3d8de53199f'

# ──────────────────────────────────────────────────────────────────────────────


# ──────────────────────────────────────────────────────────────────────────────
# Qualcomm QcomDLoader WithDLL (explicit sla-challenge.dll bundle)
# ──────────────────────────────────────────────────────────────────────────────

# https://download.lenovo.com/lsa/Resource/Tools/QcomDLoader_V1.3.0.2_WithDLL.zip
curl -L -o 'QcomDLoader_V1.3.0.2_WithDLL.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://download.lenovo.com/lsa/Resource/Tools/QcomDLoader_V1.3.0.2_WithDLL.zip'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'QcomDLoader_V1.3.0.2_WithDLL.zip' 'https://download.lenovo.com/lsa/Resource/Tools/QcomDLoader_V1.3.0.2_WithDLL.zip'

# ──────────────────────────────────────────────────────────────────────────────


# ──────────────────────────────────────────────────────────────────────────────
# Unisoc / Spreadtrum — UpgradeDownload / ResearchDownload (service auth + cert)
# ──────────────────────────────────────────────────────────────────────────────

# https://rsddownload-secure.lenovo.com/RESEARCHDOWNLOAD_R21.0.0001.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T041751Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=febfb803bf7c7b5b707096fd06a6a70ab244c0226a1efe2347568ab6af5915be
curl -L -o 'RESEARCHDOWNLOAD_R21.0.0001.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/RESEARCHDOWNLOAD_R21.0.0001.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T041751Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=febfb803bf7c7b5b707096fd06a6a70ab244c0226a1efe2347568ab6af5915be'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'RESEARCHDOWNLOAD_R21.0.0001.zip' 'https://rsddownload-secure.lenovo.com/RESEARCHDOWNLOAD_R21.0.0001.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T041751Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=febfb803bf7c7b5b707096fd06a6a70ab244c0226a1efe2347568ab6af5915be'

# ──────────────────────────────────────────────────────────────────────────────


# https://rsddownload-secure.lenovo.com/UpgradeDownload_AS_R25.20.3901_201211.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033118Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=1b869845609832ba9f5d7d3c239d4923087f7854d23cffaa32a3c18d2dfedd1e
curl -L -o 'UpgradeDownload_AS_R25.20.3901_201211.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/UpgradeDownload_AS_R25.20.3901_201211.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033118Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=1b869845609832ba9f5d7d3c239d4923087f7854d23cffaa32a3c18d2dfedd1e'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'UpgradeDownload_AS_R25.20.3901_201211.zip' 'https://rsddownload-secure.lenovo.com/UpgradeDownload_AS_R25.20.3901_201211.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033118Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=1b869845609832ba9f5d7d3c239d4923087f7854d23cffaa32a3c18d2dfedd1e'

# ──────────────────────────────────────────────────────────────────────────────


# https://rsddownload-secure.lenovo.com/UpgradeDownload_R25.20.53.10.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033205Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=86b9f0d20be464798420946ad4af35518a60482889c6e0bec60ea8397c4f8c17
curl -L -o 'UpgradeDownload_R25.20.53.10.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/UpgradeDownload_R25.20.53.10.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033205Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=86b9f0d20be464798420946ad4af35518a60482889c6e0bec60ea8397c4f8c17'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'UpgradeDownload_R25.20.53.10.zip' 'https://rsddownload-secure.lenovo.com/UpgradeDownload_R25.20.53.10.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033205Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=86b9f0d20be464798420946ad4af35518a60482889c6e0bec60ea8397c4f8c17'

# ──────────────────────────────────────────────────────────────────────────────


# https://rsddownload-secure.lenovo.com/UpgradeDownload_R25.21.1401.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033729Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=efca2a74ad707f2854bb116ac3eb20a22d6393a07d80f88c597053e1342547f0
curl -L -o 'UpgradeDownload_R25.21.1401.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/UpgradeDownload_R25.21.1401.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033729Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=efca2a74ad707f2854bb116ac3eb20a22d6393a07d80f88c597053e1342547f0'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'UpgradeDownload_R25.21.1401.zip' 'https://rsddownload-secure.lenovo.com/UpgradeDownload_R25.21.1401.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033729Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=efca2a74ad707f2854bb116ac3eb20a22d6393a07d80f88c597053e1342547f0'

# ──────────────────────────────────────────────────────────────────────────────


# https://rsddownload-secure.lenovo.com/UpgradeDownload_R25.21.1401_1.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033155Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=da80cd579d661b36726d93258e78f075621d2fd4023cf5f51d2ca9bec9fe28f3
curl -L -o 'UpgradeDownload_R25.21.1401_1.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/UpgradeDownload_R25.21.1401_1.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033155Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=da80cd579d661b36726d93258e78f075621d2fd4023cf5f51d2ca9bec9fe28f3'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'UpgradeDownload_R25.21.1401_1.zip' 'https://rsddownload-secure.lenovo.com/UpgradeDownload_R25.21.1401_1.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T033155Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=da80cd579d661b36726d93258e78f075621d2fd4023cf5f51d2ca9bec9fe28f3'

# ──────────────────────────────────────────────────────────────────────────────


# https://rsddownload-secure.lenovo.com/UpgradeDownload_R25.21.1401_OT20210629_Service.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032135Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=fd8976fceecf4ac8a6249361f4899917650d2546ee5ef9526e702585d8b23b25
curl -L -o 'UpgradeDownload_R25.21.1401_OT20210629_Service.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/UpgradeDownload_R25.21.1401_OT20210629_Service.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032135Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=fd8976fceecf4ac8a6249361f4899917650d2546ee5ef9526e702585d8b23b25'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'UpgradeDownload_R25.21.1401_OT20210629_Service.zip' 'https://rsddownload-secure.lenovo.com/UpgradeDownload_R25.21.1401_OT20210629_Service.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032135Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=fd8976fceecf4ac8a6249361f4899917650d2546ee5ef9526e702585d8b23b25'

# ──────────────────────────────────────────────────────────────────────────────


# ──────────────────────────────────────────────────────────────────────────────
# Unisoc / Spreadtrum — PAC Tool (PAC format, cert + key inside)
# ──────────────────────────────────────────────────────────────────────────────

# https://rsddownload-secure.lenovo.com/PAC_Ironbark.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032502Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=0ea7fd6c67042f61fad4bc17287fa21d8e34e656b56ad34afe61f300bd6a3860
curl -L -o 'PAC_Ironbark.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/PAC_Ironbark.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032502Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=0ea7fd6c67042f61fad4bc17287fa21d8e34e656b56ad34afe61f300bd6a3860'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'PAC_Ironbark.zip' 'https://rsddownload-secure.lenovo.com/PAC_Ironbark.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T032502Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=0ea7fd6c67042f61fad4bc17287fa21d8e34e656b56ad34afe61f300bd6a3860'

# ──────────────────────────────────────────────────────────────────────────────


# https://rsddownload-secure.lenovo.com/PAC_upgrade_tool-V2.17.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T042654Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=8a7ac19279546f896358d5509956c50ce972a26341d44cf673a66015d2656c8b
curl -L -o 'PAC_upgrade_tool-V2.17.zip' \
  -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9,es;q=0.8' \
  -H 'Cache-Control: no-cache' \
  -H 'Pragma: no-cache' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: none' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'Authorization: Bearer ${_TOKEN}' \
  -H 'guid: ${_GUID}' \
  -H 'Request-Tag: lmsa' \
  'https://rsddownload-secure.lenovo.com/PAC_upgrade_tool-V2.17.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T042654Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=8a7ac19279546f896358d5509956c50ce972a26341d44cf673a66015d2656c8b'

# wget alternative:
# wget --header='User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0' --header='Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8' --header='Accept-Language: en-US,en;q=0.9,es;q=0.8' --header='Cache-Control: no-cache' --header='Pragma: no-cache' --header='Sec-Fetch-Dest: document' --header='Sec-Fetch-Mode: navigate' --header='Sec-Fetch-Site: none' --header='Sec-Fetch-User: ?1' --header='Upgrade-Insecure-Requests: 1' --header='Authorization: Bearer ${_TOKEN}' --header='guid: ${_GUID}' --header='Request-Tag: lmsa' -O 'PAC_upgrade_tool-V2.17.zip' 'https://rsddownload-secure.lenovo.com/PAC_upgrade_tool-V2.17.zip?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20260304T042654Z&X-Amz-SignedHeaders=host&X-Amz-Expires=604800&X-Amz-Credential=AKIAS37TSJMJUUCJCY4T%2F20260304%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=8a7ac19279546f896358d5509956c50ce972a26341d44cf673a66015d2656c8b'

# ──────────────────────────────────────────────────────────────────────────────


