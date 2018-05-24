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
