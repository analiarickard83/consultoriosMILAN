# Gestión Veterinaria Milán

Sitio estático listo para GitHub Pages. Suba el contenido de esta carpeta a la rama configurada para Pages y abra `index.html`.

La aplicación funciona en modo DEMO con `localStorage`: incluye login demo, CRUD y eliminación segura de pacientes, tutores, consultas y vacunas, fotos locales, cronograma, recordatorios y WhatsApp por enlace `wa.me`/simulación. Incluye roles de Supervisor (acceso total), Veterinario (gestión clínica) y un portal remoto, de solo lectura, para tutores.

Para producción, ejecute `supabase-schema.sql` y después `supabase-security-upgrade.sql` en Supabase. La URL y clave pública del proyecto se configuran en `supabase-config.js`; dicha clave puede estar en GitHub Pages, pero nunca publique `secret`/`service_role`. Cree cuentas desde Authentication > Users y asigne el perfil y rol con SQL. Las altas administrativas automáticas y WhatsApp real deben ejecutarse mediante un backend/Edge Function seguro con `WHATSAPP_ACCESS_TOKEN`, `WHATSAPP_PHONE_NUMBER_ID`, `WHATSAPP_BUSINESS_ACCOUNT_ID`.
