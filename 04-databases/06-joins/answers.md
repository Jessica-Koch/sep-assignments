1. Foreign key
2. a. `CROSS JOIN` - shows all possible combinations between two tables.

  *Could be used to populate an inventory*

  b. `INNER JOIN` - For each row in table1 that is common in table2 a row is produced in the result table.  Does **not** contain `null` values.

  *Could be used to *

  c. `LEFT OUTER JOIN` - combines table1 and table2 so that each row from table 1 will be in table2, if table2 does not contain a common value, `null` is inserted.

  *Could be used to retrieve all customers from a table and their resulting orders, if any*

  d. `RIGHT OUTER JOIN` - combines table1 and table2 so that each row from table 2 will be in table1, if table1 does not contain a common value, `null` is inserted.

  *Could be used to see if any of the orders do not belong to our current customers, perhaps a guest account was used.*

  e. `FULL OUTER JOIN` - resulting table contains a row from each in table 1 and table 2, for each row that is not present in table1 that is in table 2 a null value will be inserted and visa versa.

  *Could be used to get information from a Claims table and a users table, see which users have claims, which do not, and which claims have no member for whatever reason*

3.  A primary key is an id associated with a row in a table, a `uuid` can be a primary key.

  A foreign key is a key in a table that is used to connect to another table, a pet table would have a foreign key associated with the person who owns the pet, that is usually represented by the owner's primary key located in the pet table.

4. Aliasing is assigning a value in the query statement to a variable name so that it is easier to remember or type etc.

5. ```
  SELECT p.name, compensation.salary, compensation.vacation_days FROM professor as p
  JOIN compensation
  ON p.id = compensation.professor_id;
  ```

6. You would use a `NATURAL` join when you wanted the query to implicitly find the commonalities between the two tables without having to write a comma separated list commonly used in `USING` clauses.  It's a shorthand version.

7. ```
  SELECT employees.name, shifts.date
  FROM employees
  FULL OUTER JOIN scheduled_shifts ON employees.id = scheduled_shifts.employee_id
  FULL OUTER JOIN shifts ON scheduled_shifts.shift_id = shifts.id;
  ```
8. a.
```
SELECT volunteers.first_name as volunteer, volunteers.foster_dog_id, dogs.name
from volunteers
LEFT OUTER JOIN dogs
ON dogs.id = foster_dog_id;```


8b.
  ```
  SELECT cats.name, adopters.first_name, cat_adoptions.date as adoption_date
from adopters
join cat_adoptions on adopters.id = cat_adoptions.adopter_id
join cats on cat_adoptions.cat_id = cats.id
WHERE adoption_date < CURRENT_DATE + INTERVAL '1 Month';```


8c.
  ```
  SELECT first_name, name from adopters
  join dog_adoptions on adopters.id != dog_adoptions.adopter_id
  cross join dogs
  where dog_adoptions.dog_id != dogs.id;;
  ```

8d.
  ```
  SELECT cats.*, dogs.*
  FROM cats, dogs
  WHERE NOT EXISTS (SELECT CA.cat_id FROM cat_adoptions CA WHERE cats.id = CA.cat_id)
  AND NOT EXISTS (SELECT DA.dog_id from dog_adoptions DA WHERE dogs.id = DA.dog_id);
  ```

8e.
  ```
  SELECT v.id, v.first_name, d.name FROM volunteers AS v
  FULL OUTER JOIN dogs AS d
    ON v.foster_dog_id = d.id
  WHERE v.available_to_foster OR v.available_to_foster IS NULL;
  ```

8f.
  ```
  SELECT first_name,
  last_name
  FROM adopters
  JOIN dog_adoptions on adopter_id = adopters.id
  JOIN dogs on dogs.id = dog_id
  where dogs.name = 'Rosco';
  ```
9a.
```
SELECT name
FROM holds
JOIN patrons ON patrons.id = patron_id
JOIN books on books.isbn = holds.isbn
WHERE books.title = 'Advanced Potion-Making';
```

9b.
```
SELECT b.title, t.checked_in_date
FROM transactions t
JOIN books b ON b.isbn = t.isbn
WHERE t.checked_in_date IS NULL;
```

9c.
```
SELECT b.title, AVG(date(t.checked_in_date) - date(t.checked_out_date)) AS avg_checkout_time
FROM transactions t
JOIN books b ON b.isbn = t.isbn
GROUP BY b.title;
```

9d.
```
SELECT b.title, date_part('years', t.checked_out_date)
FROM transactions t
JOIN books b ON b.isbn = t.isbn
WHERE date_part('years', t.checked_out_date) < 2013;
```

9e.
```
SELECT p.*, b.title
FROM transactions t
JOIN books b ON b.isbn = t.isbn
JOIN patrons p ON p.id = t.patron_id;
```
