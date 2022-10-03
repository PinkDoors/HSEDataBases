CREATE DATABASE train_logistics;
GRANT ALL PRIVILEGES ON DATABASE train_logistics TO butchenko_206;

\connect train_logistics 

CREATE TABLE "station" (
  "name" varchar PRIMARY KEY,
  "city" varchar,
  "region" varchar,
  "tracks_number" int
);

CREATE TABLE "city" (
  "name" varchar,
  "region" varchar,
  PRIMARY KEY ("name", "region")
);

CREATE TABLE "train" (
  "train_nr" bigint PRIMARY KEY,
  "length" int,
  "start_station_name" varchar,
  "end_station_name" varchar
);

CREATE TABLE "logistics" (
  "id" BIGSERIAL PRIMARY KEY,
  "train_nr" bigint,
  "start_station_name" varchar,
  "end_station_name" varchar,
  "arrival" timestamp,
  "departure" timestamp
);

ALTER TABLE "train" ADD FOREIGN KEY ("start_station_name") REFERENCES "station" ("name");

ALTER TABLE "train" ADD FOREIGN KEY ("end_station_name") REFERENCES "station" ("name");

ALTER TABLE "logistics" ADD FOREIGN KEY ("train_nr") REFERENCES "train" ("train_nr");

ALTER TABLE "logistics" ADD FOREIGN KEY ("start_station_name") REFERENCES "station" ("name");

ALTER TABLE "logistics" ADD FOREIGN KEY ("end_station_name") REFERENCES "station" ("name");

ALTER TABLE "station" ADD FOREIGN KEY ("city", "region") REFERENCES "city" ("name", "region");
