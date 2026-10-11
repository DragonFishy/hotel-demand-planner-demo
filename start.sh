#!/usr/bin/env bash
# Fetch the app (code, models, reports) from a private repo with the Space's secret token, then serve it read-only.
set -euo pipefail
python - <<'PY'
import os, tarfile
from huggingface_hub import hf_hub_download
p = hf_hub_download(repo_id=os.environ["BUNDLE_REPO"], filename="bundle.tar.gz", repo_type="dataset", token=os.environ["HF_TOKEN"])
tarfile.open(p).extractall("bundle", filter="data")
PY
cd bundle
export PYTHONPATH="$PWD/src:$PWD" READ_ONLY=1
exec python -m uvicorn api.main:app --host 0.0.0.0 --port "${PORT:-7860}"
