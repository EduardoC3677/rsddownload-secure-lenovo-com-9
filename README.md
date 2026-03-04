# Crawl of https://rsddownload-secure.lenovo.com

| Setting | Value |
|---------|-------|
| Depth | 0 |
| Delay | 0.25s |
| Download extensions | all |
| Skip download extensions | all |
| Upload extensions | all |
| Concurrency | auto workers |
| Skip media files | false |
| LMSA country | (all regions) |
| Run | #52 |
| Status | ✅ Crawl complete |

---

## MTK Tools – Download, Extract & MT6768 DA/SVC/Auth Collection

### Automatic (GitHub Actions – recommended)

Go to **Actions → Download & Extract MTK Tools (MT6768)** → **Run workflow**.

The workflow will:
1. Download every MTK / SP\_Flash\_Tool archive listed in `lmsa_tool_urls.txt`.
2. Extract **all** files from each archive into `mtk_tools/extracted/<tool-name>/`.
3. Collect files related to the **MT6768** chipset into:

| Folder | Contents |
|--------|----------|
| `mtk_tools/mt6768/DA/` | Download Agent binaries (`MTK_AllInOne_DA.bin`, `DA_SWSEC*.bin`, …) |
| `mtk_tools/mt6768/SVC/` | Service / SVC helper files |
| `mtk_tools/mt6768/Auth/` | Auth / certificate / RSA / key files |
| `mtk_tools/mt6768/Scatter/` | Scatter / partition-map files |
| `mtk_tools/mt6768/Other/` | Any other file with `MT6768` / `6768` in its name |

4. Commit and push all extracted files back to this repository.

### Manual (local machine)

```bash
# clone the repo first, then:
chmod +x extract_mtk_da_mt6768.sh
./extract_mtk_da_mt6768.sh               # uses lmsa_tool_urls.txt, output → mtk_tools/
# or with custom paths:
./extract_mtk_da_mt6768.sh /path/to/lmsa_tool_urls.txt /path/to/output
```

Requirements: `bash ≥ 4`, `curl` (or `wget`), `unzip`.
