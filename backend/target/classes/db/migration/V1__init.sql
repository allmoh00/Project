create table places (
  id bigserial primary key,
  name varchar(200) not null,
  slug varchar(100) not null unique,
  summary text not null,
  body text not null
);

create table place_images (
  id bigserial primary key,
  place_id bigint not null references places(id) on delete cascade,
  url varchar(500) not null,
  alt_text varchar(255) not null,
  sort_order integer not null default 0
);

create index idx_place_images_place_id on place_images(place_id);
create index idx_place_images_sort on place_images(place_id, sort_order);

create table team_members (
  id bigserial primary key,
  name varchar(200) not null,
  email varchar(255) not null,
  phone varchar(50),
  reg_no varchar(50),
  gender varchar(50),
  bio text
);

create table contact_messages (
  id bigserial primary key,
  name varchar(120) not null,
  email varchar(255) not null,
  phone varchar(50),
  message text not null,
  status varchar(50) not null,
  created_at timestamptz not null default now()
);

create index idx_contact_messages_created_at on contact_messages(created_at);

