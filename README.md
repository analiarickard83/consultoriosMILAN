# Gestión Veterinaria Milán

Sitio estático listo para GitHub Pages. Suba el contenido de esta carpeta a la rama configurada para Pages y abra `index.html`.

La aplicación funciona en modo DEMO con `localStorage`: incluye login demo, CRUD de pacientes y tutores, fotos locales, historias clínicas, vacunas, cronograma, recordatorios y WhatsApp por enlace `wa.me`/simulación.

Para producción, ejecute `supabase-schema.sql` en Supabase y conecte un backend seguro para Auth, datos, Storage y la API oficial de WhatsApp. Variables del backend: `WHATSAPP_ACCESS_TOKEN`, `WHATSAPP_PHONE_NUMBER_ID`, `WHATSAPP_BUSINESS_ACCOUNT_ID`.
