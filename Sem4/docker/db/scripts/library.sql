CREATE DATABASE library;
GRANT ALL PRIVILEGES ON DATABASE library TO butchenko_206;

\connect library

CREATE TABLE "book_copy" (
  "id" bigint PRIMARY KEY,
  "ISBN" bigint,
  "shelf_position" varchar
);

CREATE TABLE "book" (
  "ISBN" bigint PRIMARY KEY,
  "page_number" int,
  "year" int,
  "name" varchar,
  "author" varchar,
  "publisher_name" varchar
);

CREATE TABLE "book_categories" (
  "id" BIGSERIAL PRIMARY KEY,
  "ISBN" bigint,
  "category_name" varchar
);

CREATE TABLE "category_hierarchy" (
  "id" BIGSERIAL PRIMARY KEY,
  "child_category" varchar,
  "parent_category" varchar
);

CREATE TABLE "category" (
  "name" varchar PRIMARY KEY
);

CREATE TABLE "publisher" (
  "name" varchar PRIMARY KEY,
  "address" varchar
);

CREATE TABLE "reader" (
  "id" bigint PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "address" varchar,
  "birthdate" timestamp
);

CREATE TABLE "borrowed_books" (
  "id" BIGSERIAL PRIMARY KEY,
  "reader_id" bigint,
  "book_copy_id" bigint,
  "return_date" timestamp
);

ALTER TABLE "book_copy" ADD FOREIGN KEY ("ISBN") REFERENCES "book" ("ISBN");

ALTER TABLE "book" ADD FOREIGN KEY ("publisher_name") REFERENCES "publisher" ("name");

ALTER TABLE "book_categories" ADD FOREIGN KEY ("ISBN") REFERENCES "book" ("ISBN");

ALTER TABLE "book_categories" ADD FOREIGN KEY ("category_name") REFERENCES "category" ("name");

ALTER TABLE "category_hierarchy" ADD FOREIGN KEY ("child_category") REFERENCES "category" ("name");

ALTER TABLE "category_hierarchy" ADD FOREIGN KEY ("parent_category") REFERENCES "category" ("name");

ALTER TABLE "borrowed_books" ADD FOREIGN KEY ("reader_id") REFERENCES "reader" ("id");

ALTER TABLE "borrowed_books" ADD FOREIGN KEY ("book_copy_id") REFERENCES "book_copy" ("id");
