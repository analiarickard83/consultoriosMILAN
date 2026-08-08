-- Migración de roles y acceso remoto de tutores. Ejecutar después de supabase-schema.sql.
alter table public.profiles add column if not exists role text not null default 'veterinario' check (role in ('supervisor','veterinario','tutor'));
alter table public.profiles add column if not exists owner_id uuid unique references public.owners(id) on delete cascade;
-- El alta real de usuarios se hace exclusivamente con Supabase Auth/Admin API desde un backend seguro.
create or replace function public.is_staff() returns boolean language sql stable security definer set search_path=public as $$ select exists(select 1 from public.profiles where id=auth.uid() and role in ('supervisor','veterinario')) $$;
create or replace function public.is_supervisor() returns boolean language sql stable security definer set search_path=public as $$ select exists(select 1 from public.profiles where id=auth.uid() and role='supervisor') $$;
-- Reemplazar las políticas básicas por políticas de clínica: personal autenticado, tutor únicamente sus mascotas.
drop policy if exists "own owners" on public.owners; drop policy if exists "own pets" on public.pets; drop policy if exists "own records" on public.medical_records; drop policy if exists "own vaccinations" on public.vaccinations; drop policy if exists "own reminders" on public.reminders; drop policy if exists "own logs" on public.whatsapp_logs;
create policy "staff manages owners" on public.owners for all using (public.is_staff()) with check (public.is_staff());
create policy "staff or tutor reads pets" on public.pets for select using (public.is_staff() or owner_id=(select owner_id from public.profiles where id=auth.uid()));
create policy "staff manages pets" on public.pets for all using (public.is_staff()) with check (public.is_staff());
create policy "staff or tutor reads records" on public.medical_records for select using (public.is_staff() or pet_id in (select id from public.pets where owner_id=(select owner_id from public.profiles where id=auth.uid())));
create policy "staff manages records" on public.medical_records for all using (public.is_staff()) with check (public.is_staff());
create policy "staff or tutor reads vaccinations" on public.vaccinations for select using (public.is_staff() or pet_id in (select id from public.pets where owner_id=(select owner_id from public.profiles where id=auth.uid())));
create policy "staff manages vaccinations" on public.vaccinations for all using (public.is_staff()) with check (public.is_staff());
create policy "staff manages reminders" on public.reminders for all using (public.is_staff()) with check (public.is_staff());
create policy "staff manages logs" on public.whatsapp_logs for all using (public.is_staff()) with check (public.is_staff());
