CREATE TABLE guests (
  "id"           INTEGER,
  "first_name"   VARCHAR(16),
  "last_name"    VARCHAR(16),
  "phone_number" VARCHAR(16),
  "email"      VARCHAR(64),
  "address"      VARCHAR(64),

  PRIMARY KEY("id")
);

CREATE TABLE rooms (
  "id" INTEGER,
  "floor" INTEGER,
  "room_number" INTEGER,
  "price_per_night" DECIMAL(13,4),

  PRIMARY KEY("id")
);

CREATE TABLE bookings (
  "guest_id" INTEGER,
  "room_id" INTEGER,
  "check_in_date" DATE,
  "check_out_date" DATE,

  FOREIGN KEY ("guest_id")
      REFERENCES "guests" ("id")
      ON DELETE CASCADE,

    FOREIGN KEY ("room_id")
      REFERENCES "rooms" ("id")
      ON DELETE CASCADE
);


INSERT INTO rooms
  ("id", "floor", "room_number", "price_per_night")
VALUES
  ( 1,      3,    1,  50),
  ( 2,            1,    2,  70),
  ( 3,            4,    3,  10),
  ( 4,            5,    1,  90),
  ( 5,            13,    3,  30),
  ( 6,            2,    2,  20),
  ( 7,            4,    1,  10);


INSERT INTO guests
  ("id", "first_name", "last_name", "phone_number", "email", "address")
VALUES
  ( 1,   'Hermione',   'Granger',   '676-464-7837','hermione1@gmail.com', '32 Granger''s Street'),
  ( 2,   'Arabella',   'Figg',    '843-228-5239','arabella2@gmail.com', '4 Wisteria Walk'),
  ( 3,   'Argus',      'Filch',   '568-366-7747','argus3@gmail.com', '14 Old Hogwarts Office'),
  ( 4,   'Sirius',     'Black',    '878-666-4663', 'sirius5@gmail.com',     '12 Grimmauld Place'),
  ( 5,   'Marjorie',   'Dursley',    '463-528-2253',  'marjorie5@gmail.com',  '1990 Next Door to Fubster');


INSERT INTO bookings
  ("guest_id", "room_id", "check_in_date", "check_out_date")
VALUES
 ( 2,     4,           CURRENT_DATE + INTERVAL '1 YEAR, 1 DAY',  CURRENT_DATE + INTERVAL '1 YEAR, 5 DAYS'),
 ( 1,     2,          CURRENT_DATE + INTERVAL '1 YEAR, 1 DAY',  CURRENT_DATE + INTERVAL '1 YEAR, 1 WEEK, 2 DAYS'),
 ( 4,     3,            CURRENT_DATE + INTERVAL '7 DAYS',          CURRENT_DATE + INTERVAL '2 WEEKS'),
 ( 5,     1,         CURRENT_DATE + INTERVAL '3 DAYS',          CURRENT_DATE + INTERVAL '1 WEEK');
