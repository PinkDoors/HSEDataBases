CREATE DATABASE hospital;
GRANT ALL PRIVILEGES ON DATABASE hospital TO butchenko_206;

\connect hospital

CREATE TABLE "station_personell" (
  "pers_nr" bigint PRIMARY KEY,
  "station" bigint,
  "name_number" int
);

CREATE TABLE "caregivers" (
  "pers_nr" bigint PRIMARY KEY,
  "qualification" varchar
);

CREATE TABLE "doctors" (
  "pers_nr" bigint PRIMARY KEY,
  "area" varchar,
  "rank" varchar
);

CREATE TABLE "patient" (
  "patient_nr" bigint PRIMARY KEY,
  "name" varchar,
  "disease" varchar,
  "treating_doctor_nr" bigint
);

CREATE TABLE "admission" (
  "id" BIGSERIAL PRIMARY KEY,
  "patient_nr" bigint,
  "room_nr" bigint,
  "from" timestamp,
  "to" timestamp
);

CREATE TABLE "room" (
  "room_nr" bigint PRIMARY KEY,
  "station" bigint,
  "beds_number" int
);

CREATE TABLE "station" (
  "stat_nr" bigint PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "station_personell" ADD FOREIGN KEY ("station") REFERENCES "station" ("stat_nr");

ALTER TABLE "patient" ADD FOREIGN KEY ("treating_doctor_nr") REFERENCES "doctors" ("pers_nr");

ALTER TABLE "admission" ADD FOREIGN KEY ("patient_nr") REFERENCES "patient" ("patient_nr");

ALTER TABLE "admission" ADD FOREIGN KEY ("room_nr") REFERENCES "room" ("room_nr");

ALTER TABLE "room" ADD FOREIGN KEY ("station") REFERENCES "station" ("stat_nr");
