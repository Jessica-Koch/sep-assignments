1. The benefits of data normalization are reduced redundancy and improved data integrity.  Databases will be smaller because there are less repeated pieces of data, that makes queries faster, an application faster, etc.  An example is to have a separate table for a "thing".  If there was a table documenting a doctors office, one table may contain patients, another would contain appointments, and another would contain doctors.  the patients and doctors would be joined on the appointments table, each piece of data has its own place.

2. 1NF means that each field can only store one value.  If a patient saw a doctor, a column could be prescriptions, and the value within it couldn't be an array, itwould have to be another row ie:

*BAD*

|patient|	RX|
|:--:|:--:|
|	Bob|	prescription1,prescription2|
|	Ashley|	prescription1|

*1NF Compliant*

|patient|	RX|
|:--:|:--:|
|	Bob|	prescription1|
|	Bob|	prescription2|
|	Ashley|	prescription1|

2NF means that the data within a table should actually make sense.
*BAD*

|patient|	RX|phone|
|:--:|:--:|:--|
|	Bob|	prescription1|8495837483|
|	Bob|	prescription2|8495837483|
|	Ashley|	prescription1|4857203984|

*2NF Compliant*

|patient|	phone|
|:--:|:--:|
|	Bob|8495837483|
|	Ashley|4857203984|

|patient|	RX|
|:--:|:--:|
|	Bob|	prescription1|
|	Bob|	prescription2|
|	Ashley|	prescription1|

phone number and prescription are not related, so they should be in two separate tables.
---
3NF means that data within a table should not have dependencies.  If you have a patient table, and an invoice table, you shouldn't need the patient name and patient Id in the invoice table because the id is already used to grab the patient, the name is extraneous information.

BCNF basically is using join tables to create bridges between pieces of data that are related.

3. http://sqlfiddle.com/#!17/4519a

```
CREATE TABLE student_records (
  "id"       INTEGER,
  "student_id"     INTEGER,
  "grade"          VARCHAR(1),
  "subject"        VARCHAR(11)
);

CREATE TABLE students (
  "student_id"     INTEGER,
  "student_email"  VARCHAR(24),
  "student_name"   VARCHAR(9)
);

CREATE TABLE professors (
  "professor_id"   INTEGER,
  "professor_name" VARCHAR(9)
);

CREATE TABLE classes (
  "id"       INTEGER,
  "professor_id"   INTEGER,
  "subject"        VARCHAR(11)
);


INSERT INTO student_records
    ("id", "student_id", "subject",     "grade")
VALUES
    ( 1,    1, 'Philosophy',  'A'),
    ( 2,    2,   'Philosophy',  'C'),
    ( 3,    3,'Economics',   'A'),
    ( 4,    4,'Mathematics', 'B'),
    ( 5,    5,'Economics',   'B');

INSERT INTO students
    ( "student_id", "student_email",            "student_name")
VALUES
    ( 1,           'john.b20@hogwarts.edu',    'John B'      ),
    ( 2,           'sarah.s20@hogwarts.edu',   'Sarah S'),
    ( 3,           'martha.l20@hogwarts.edu',  'Martha L'),
    ( 4,           'james.g20@hogwarts.edu',   'James G'),
    ( 5,           'stanley.p20@hogwarts.edu', 'Stanley P');


INSERT INTO professors
    ("professor_id", "professor_name")
VALUES
    (2,             'William C'),
    (2,             'William C'),
    (1,             'Natalie M'),
    (3,             'Mark W'),
    (1,             'Natalie M');


INSERT INTO classes
    ("id", "professor_id", "subject")
VALUES
    ( 1, 2, 'Philosophy'),
    ( 2,             2,             'Philosophy'),
    ( 3,         1,            'Economics'),
    ( 4,         3,                    'Mathematics'),
    ( 5,         1,           'Economics'  );
```

4. Drawbacks include longer query times, because there are now joins, the queries will take longer when you're making `GET` requests, but it will be faster to make a `CREATE` request.

5. I would add the courses taught to the professors table.

6. You have to weigh how often you will be changing the data or writing to that table.  Courses will be predefined and you will most likely have to read from that table while grades would change frequently, it would be more reasonable to associate teachers and courses together and possibly haec duplicate columns since this data is unlikely to change frequently while students and grades will change and so you will need to write to those more frequently, so keep those as a join table. 
