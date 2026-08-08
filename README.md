# Gestión Veterinaria Milán

Sitio estático listo para GitHub Pages. Suba el contenido de esta carpeta a la rama configurada para Pages y abra `index.html`.

La aplicación funciona en modo DEMO con `localStorage`: incluye login demo, CRUD y eliminación segura de pacientes, tutores, consultas y vacunas, fotos locales, cronograma, recordatorios y WhatsApp por enlace `wa.me`/simulación. Incluye roles de Supervisor (acceso total), Veterinario (gestión clínica) y un portal remoto, de solo lectura, para tutores.

Para producción, ejecute `supabase-schema.sql` y después `supabase-security-upgrade.sql` en Supabase. Conecte un backend seguro para Supabase Auth, altas de usuarios, datos, Storage y la API oficial de WhatsApp. Variables del backend: `WHATSAPP_ACCESS_TOKEN`, `WHATSAPP_PHONE_NUMBER_ID`, `WHATSAPP_BUSINESS_ACCOUNT_ID`.
