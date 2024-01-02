BEGIN;

INSERT INTO "clinic" ("name", "latitude", "longitude")  VALUES ('Clinic 1', 57.707338, 11.932128);
INSERT INTO "clinic" ("name", "latitude", "longitude") VALUES ('Clinic 2', 57.695644, 11.979593);

-- NOTE: all passwords are "test" (since those are only meant for testing)
INSERT INTO "user" ("name", "username", "pw_hash", "role") VALUES ('Patient 1', 'patient1', '$2b$10$jMW33.ViVG8r9Jv7nsbPhu2ItagSF4r8e2r5iqZClgq/e7XEk5Pwy', 'patient');
INSERT INTO "user" ("name", "username", "pw_hash", "role") VALUES ('Patient 2', 'patient2', '$2b$10$jMW33.ViVG8r9Jv7nsbPhu2ItagSF4r8e2r5iqZClgq/e7XEk5Pwy', 'patient');
INSERT INTO "user" ("name", "username", "pw_hash", "role") VALUES ('Patient 3', 'patient3', '$2b$10$jMW33.ViVG8r9Jv7nsbPhu2ItagSF4r8e2r5iqZClgq/e7XEk5Pwy', 'patient');
INSERT INTO "user" ("name", "username", "pw_hash", "role") VALUES ('Patient 4', 'patient4', '$2b$10$jMW33.ViVG8r9Jv7nsbPhu2ItagSF4r8e2r5iqZClgq/e7XEk5Pwy', 'patient');
INSERT INTO "user" ("name", "username", "pw_hash", "role") VALUES ('Patient 5', 'patient5', '$2b$10$jMW33.ViVG8r9Jv7nsbPhu2ItagSF4r8e2r5iqZClgq/e7XEk5Pwy', 'patient');

INSERT INTO "user" ("name", "username", "pw_hash", "role", "clinic_id") VALUES ('Dentist 1', 'dentist1', '$2b$10$jMW33.ViVG8r9Jv7nsbPhu2ItagSF4r8e2r5iqZClgq/e7XEk5Pwy', 'dentist', 1);
INSERT INTO "user" ("name", "username", "pw_hash", "role", "clinic_id") VALUES ('Dentist 2', 'dentist2', '$2b$10$jMW33.ViVG8r9Jv7nsbPhu2ItagSF4r8e2r5iqZClgq/e7XEk5Pwy', 'dentist', 1);
INSERT INTO "user" ("name", "username", "pw_hash", "role", "clinic_id") VALUES ('Dentist 3', 'dentist3', '$2b$10$jMW33.ViVG8r9Jv7nsbPhu2ItagSF4r8e2r5iqZClgq/e7XEk5Pwy', 'dentist', 1);
INSERT INTO "user" ("name", "username", "pw_hash", "role", "clinic_id") VALUES ('Dentist 4', 'dentist4', '$2b$10$jMW33.ViVG8r9Jv7nsbPhu2ItagSF4r8e2r5iqZClgq/e7XEk5Pwy', 'dentist', 2);
INSERT INTO "user" ("name", "username", "pw_hash", "role", "clinic_id") VALUES ('Dentist 5', 'dentist5', '$2b$10$jMW33.ViVG8r9Jv7nsbPhu2ItagSF4r8e2r5iqZClgq/e7XEk5Pwy', 'dentist', 2);

INSERT INTO "user" ("name", "username", "pw_hash", "role") VALUES ('Admin 1', 'admin1', '$2b$10$jMW33.ViVG8r9Jv7nsbPhu2ItagSF4r8e2r5iqZClgq/e7XEk5Pwy', 'admin');

INSERT INTO "timeslot" (dentist_id, start_time, end_time) VALUES (6, '2023-12-10 12:00:00', '2023-12-10 13:00:00');
INSERT INTO "timeslot" (dentist_id, start_time, end_time) VALUES (6, '2023-12-10 15:00:00', '2023-12-10 15:45:00');

INSERT INTO "timeslot" (dentist_id, start_time, end_time) VALUES (7, '2024-03-01 15:00:00', '2024-03-01 16:00:00');
INSERT INTO "timeslot" (dentist_id, start_time, end_time) VALUES (7, '2024-03-01 16:00:00', '2024-03-01 17:00:00');
INSERT INTO "timeslot" (dentist_id, start_time, end_time) VALUES (7, '2024-03-01 17:00:00', '2024-03-01 18:00:00');


INSERT INTO "appointment" (timeslot_id, patient_id, dentist_id, confirmed) VALUES (1, 1, 6, true);
INSERT INTO "appointment" (timeslot_id, patient_id, dentist_id, confirmed) VALUES (2, 2, 6, true);

INSERT INTO "notification" ("user_id", topic, "message") VALUES (1, 'confirmed', 'Your appointment on Dec 10th, 13:00 has been confirmed');
INSERT INTO "notification" ("user_id", topic, "message") VALUES (6, 'confirmed', 'Patient 1 has cancelled the appointment on Dec 10th, 13:00');

COMMIT;