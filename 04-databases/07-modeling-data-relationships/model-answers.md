1a.
```
SELECT g.*
FROM guests g
WHERE NOT EXISTS (SELECT bookings.guest_id FROM bookings WHERE g.id = bookings.guest_id);
```

1b.
```
SELECT guests.first_name, bookings.guest_id, bookings.check_in_date, bookings.check_out_date, COUNT(*)
FROM bookings
JOIN guests on guests.id = bookings.guest_id
GROUP BY guests.first_name, bookings.guest_id, bookings.check_in_date, bookings.check_out_date
HAVING COUNT(*) > 1;
```

1c.
```
SELECT guests.first_name, bookings.room_id, bookings.guest_id, COUNT(*)
FROM bookings
JOIN guests on guests.id = bookings.guest_id
GROUP BY guests.first_name,bookings.room_id, bookings.guest_id
HAVING COUNT(*) > 1;
```
1d.
```
SELECT bookings.room_id, count(DISTINCT bookings.guest_id)
FROM bookings
JOIN guests on guests.id = bookings.guest_id
GROUP BY bookings.room_id;
```

2. https://app.quickdatabasediagrams.com/#/schema/yKvIdbFflkKKfh2OUFemSQ

3a.
```
SELECT students.first_name, courses.name
FROM enrollments
JOIN students on students.id = enrollments.student_id
JOIN courses on courses.id = enrollments.course_id
WHERE courses.id = 1;
```

3b.
```
SELECT COUNT(e.grade), e.grade, courses.name
FROM enrollments e
JOIN courses on courses.id = e.course_id
WHERE courses.id = 1
GROUP BY e.grade, courses.name;
```

3c.
```
SELECT COUNT(DISTINCT e.student_id), courses.name
FROM enrollments e
JOIN courses on courses.id = e.course_id
JOIN students on e.student_id = students.id
GROUP BY courses.name;
```

3d.
```
SELECT COUNT(DISTINCT e.student_id) as roster, courses.name
FROM enrollments e
JOIN courses on courses.id = e.course_id
JOIN students on e.student_id = students.id
GROUP BY courses.name
ORDER BY roster DESC;
```
