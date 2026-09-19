#!/bin/bash
# Publica la API (Edge Function pau-europa) sin Docker.
set -e
cd "$(dirname "$0")/.."
supabase functions deploy pau-europa --use-api --no-verify-jwt
