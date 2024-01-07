CREATE TYPE "user_role" AS ENUM (
  'patient',
  'dentist',
  'admin'
);

CREATE TYPE "log_level" AS ENUM (
  'info',
  'error'
);

CREATE TYPE "notification_topic" AS ENUM (
  'confirmed',
  'cancelled',
  'changed',
  'new'
);

CREATE TABLE "clinic" (
  "id" serial PRIMARY KEY,
  "name" varchar,
  "latitude" decimal(9,6),
  "longitude" decimal(9,6)
);

CREATE TABLE "logs" (
  "id" serial PRIMARY KEY,
  "timestamp" timestamp default now(),
  "topic" varchar,
  "payload" text
);

CREATE TABLE "user" (
  "id" serial PRIMARY KEY,
  "name" varchar not null,
  "username" varchar unique not null,
  "pw_hash" varchar not null,
  "clinic_id" int, -- for dentists
  "role" user_role
);

CREATE TABLE "timeslot" (
  "id" serial PRIMARY KEY,
  "dentist_id" int,
  "start_time" timestamp,
  "end_time" timestamp
);

CREATE TABLE "patient_on_dentist" (
  "patient_id" int,
  "dentist_id" int,
  "favorite_dentist" boolean,
  "rating" int,
  PRIMARY KEY ("patient_id", "dentist_id")
);

CREATE TABLE "notification" (
  "id" serial PRIMARY KEY,
  "user_id" int,
  "topic" notification_topic,
  "message" text,
  "read" boolean default false
);

CREATE TABLE "appointment" (
  "id" serial PRIMARY KEY,
  "timeslot_id" int,
  "patient_id" int,
  "dentist_id" int,
  "cancelled" boolean DEFAULT false,
  "confirmed" boolean DEFAULT false
);

ALTER TABLE "user" ADD FOREIGN KEY ("clinic_id") REFERENCES "clinic" ("id");

ALTER TABLE "patient_on_dentist" ADD FOREIGN KEY ("patient_id") REFERENCES "user" ("id");

ALTER TABLE "patient_on_dentist" ADD FOREIGN KEY ("dentist_id") REFERENCES "user" ("id");

ALTER TABLE "notification" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "appointment" ADD FOREIGN KEY ("patient_id") REFERENCES "user" ("id");

ALTER TABLE "appointment" ADD FOREIGN KEY ("dentist_id") REFERENCES "user" ("id");

ALTER TABLE "appointment" ADD FOREIGN KEY ("timeslot_id") REFERENCES "timeslot" ("id");
