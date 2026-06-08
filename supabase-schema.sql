-- PropostaSmart — schema inicial
create extension if not exists "pgcrypto";

-- Empresas
create table public.empresas (
  id uuid default gen_random_uuid() primary key,
  nome text not null,
  codigo text unique not null default upper(substr(md5(random()::text), 1, 6)),
  created_at timestamptz default now()
);

-- Perfis de usuário (extends auth.users)
create table public.profiles (
  id uuid references auth.users on delete cascade primary key,
  empresa_id uuid references public.empresas on delete set null,
  nome text,
  created_at timestamptz default now()
);

-- Propostas
create table public.propostas (
  id bigint generated always as identity primary key,
  empresa_id uuid references public.empresas on delete cascade not null,
  user_id uuid references auth.users on delete cascade not null,
  user_nome text,
  nome_cliente text not null default '',
  total numeric not null default 0,
  estado jsonb not null,
  saved_at timestamptz default now()
);

-- RLS
alter table public.empresas  enable row level security;
alter table public.profiles  enable row level security;
alter table public.propostas enable row level security;

-- Policies: empresas
create policy "empresas_select" on public.empresas for select
  using (id in (select empresa_id from public.profiles where id = auth.uid()));
create policy "empresas_insert" on public.empresas for insert
  with check (true);

-- Policies: profiles
create policy "profiles_select" on public.profiles for select
  using (id = auth.uid());
create policy "profiles_insert" on public.profiles for insert
  with check (id = auth.uid());
create policy "profiles_update" on public.profiles for update
  using (id = auth.uid());

-- Policies: propostas
create policy "propostas_select" on public.propostas for select
  using (empresa_id in (select empresa_id from public.profiles where id = auth.uid()));
create policy "propostas_insert" on public.propostas for insert
  with check (
    user_id = auth.uid() and
    empresa_id in (select empresa_id from public.profiles where id = auth.uid())
  );
create policy "propostas_delete" on public.propostas for delete
  using (user_id = auth.uid());

-- Trigger: cria perfil ao criar usuário
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer as $$
begin
  insert into public.profiles (id, nome)
  values (new.id, coalesce(new.raw_user_meta_data->>'nome', ''));
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();
