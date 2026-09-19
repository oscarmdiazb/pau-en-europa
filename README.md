# Pau en Europa

Regalo de Oscar: app de viaje (plan diario, entradas, gastos, diario con fotos, pasaporte de sellos). Funciona sin internet.

- Pantalla: https://oscarmdiazb.github.io/pau-en-europa/ (carpeta `public/`, se publica con `./deploy-web.sh`).
- Datos: Supabase `oscar-apps`. Contenido del viaje en `app_state` fila `pau-europa-seed`; lo que Pau escribe en la fila `pau-europa`; fotos en el bucket privado `pau-europa`.
- API: Edge Function `supabase/functions/pau-europa` (se publica con `./build-edge.sh`). Pide la clave `PAU_KEY`.
- Cambiar el plan: editar el Excel `seed/research.xlsx` (o `seed/build_seed.py`) y correr `./upload-seed.sh`. No borra lo que Pau escribió.
