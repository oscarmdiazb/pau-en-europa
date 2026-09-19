#!/bin/bash
# Publica la pantalla (public/) en GitHub Pages: https://oscarmdiazb.github.io/pau-en-europa/
# (El contenido del viaje NO está aquí: vive en Supabase, detrás de la clave.)
set -e
cd "$(dirname "$0")"
git add -A && git commit -qm "Actualiza la app" || true
git push -q origin main
git push -q --force origin $(git subtree split --prefix public main):refs/heads/gh-pages
echo "Publicado. Tarda ~1 min: https://oscarmdiazb.github.io/pau-en-europa/"
