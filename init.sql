CREATE TYPE "user_role" AS ENUM (
  'patient',
  'dentist'
);

CREATE TYPE "log_level" AS ENUM (
  'info',
  'error'
);

CREATE TYPE "notification_topic" AS ENUM (
  'confirmed',
  'cancelled'
);

CREATE TABLE "clinic" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "location" point
);

CREATE TABLE "logs" (
  "id" int PRIMARY KEY,
  "user_id" int,
  "level" log_level,
  "message" text
);

CREATE TABLE "user" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "username" varchar,
  "pw_hash" varchar,
  "clinic_id" int,
  "role" user_role
);

CREATE TABLE "timeslot" (
  "id" int PRIMARY KEY,
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
  "timeslot_id" int,
  "user_id" int,
  "topic" notification_topic,
  "message" text
);

CREATE TABLE "appointment" (
  "id" int PRIMARY KEY,
  "timeslot_id" int,
  "patient_id" int,
  "dentist_id" int,
  "cancelled" boolean DEFAULT false,
  "confirmed" boolean DEFAULT false
);

ALTER TABLE "logs" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user" ADD FOREIGN KEY ("clinic_id") REFERENCES "clinic" ("id");

ALTER TABLE "patient_on_dentist" ADD FOREIGN KEY ("patient_id") REFERENCES "user" ("id");

ALTER TABLE "patient_on_dentist" ADD FOREIGN KEY ("dentist_id") REFERENCES "user" ("id");

ALTER TABLE "notification" ADD FOREIGN KEY ("timeslot_id") REFERENCES "timeslot" ("id");

ALTER TABLE "notification" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "appointment" ADD FOREIGN KEY ("patient_id") REFERENCES "user" ("id");

ALTER TABLE "appointment" ADD FOREIGN KEY ("dentist_id") REFERENCES "user" ("id");

ALTER TABLE "appointment" ADD FOREIGN KEY ("timeslot_id") REFERENCES "timeslot" ("id");
