#!/bin/bash
# Reconstruye seed.json desde el Excel y lo sube a Supabase (fila app_state 'pau-europa-seed').
# No toca lo que Pau haya escrito o marcado: eso vive en la fila 'pau-europa'.
set -e
cd "$(dirname "$0")"
python3 seed/build_seed.py
set -a; source ../.env.supabase; set +a
python3 - <<'PY'
import json, os, urllib.request
seed = json.load(open('seed/seed.json'))
body = json.dumps({'app': 'pau-europa-seed', 'state': seed}).encode()
url = os.environ['SUPABASE_URL'] + '/rest/v1/app_state?on_conflict=app'
k = os.environ['SUPABASE_SERVICE_KEY']
req = urllib.request.Request(url, body, method='POST', headers={'apikey': k, 'Authorization': 'Bearer ' + k,
      'Content-Type': 'application/json', 'Prefer': 'resolution=merge-duplicates'})
print('Seed subido:', urllib.request.urlopen(req).status, 'versión', seed['version'])
PY
