CREATE TABLE students (
  "id"           INTEGER,
  "first_name"   VARCHAR(16),
  "last_name"    VARCHAR(16),
  "phone_number" VARCHAR(16),
  "email"      VARCHAR(64),
  "address"      VARCHAR(64),

  PRIMARY KEY("id")
);

CREATE TABLE courses (
  "id" INTEGER,
  "name" VARCHAR(64),

  PRIMARY KEY("id")
);

CREATE TABLE enrollments (
  "student_id" INTEGER,
  "course_id" INTEGER,
  "grade" VARCHAR(16),

  FOREIGN KEY ("student_id")
      REFERENCES "students" ("id")
      ON DELETE CASCADE,

    FOREIGN KEY ("course_id")
      REFERENCES "courses" ("id")
      ON DELETE CASCADE
);



INSERT INTO courses
  ("id", "name")
VALUES
  (1, 'Potions'),
  (2, 'Care of Magical Creatures'),
  (3, 'Divination'),
  (4, 'Defense against the Darkarts'),
  (5, 'Transfiguration');


INSERT INTO students
  ("id", "first_name", "last_name", "phone_number", "email", "address")
VALUES
  ( 1,   'Hermione',   'Granger',   '676-464-7837','hermione1@gmail.com', '32 Granger''s Street'),
  ( 2,   'Arabella',   'Figg',    '843-228-5239','arabella2@gmail.com', '4 Wisteria Walk'),
  ( 3,   'Argus',      'Filch',   '568-366-7747','argus3@gmail.com', '14 Old Hogwarts Office'),
  ( 4,   'Sirius',     'Black',    '878-666-4663', 'sirius5@gmail.com',     '12 Grimmauld Place'),
  ( 5,   'Marjorie',   'Dursley',    '463-528-2253',  'marjorie5@gmail.com',  '1990 Next Door to Fubster');


INSERT INTO enrollments
  ("course_id", "student_id", "grade")
VALUES
 ( 2,     4,            'D'),
 ( 1,     1,           'A'),
 ( 2,     3,             'C'),
 ( 5,     1,          'A'),
  ( 1,     4,          'B'),
  ( 1,     2,          'B');
