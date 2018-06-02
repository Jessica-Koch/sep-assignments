1. Sub queries are selects within selects.

2. You can use a subquery within the `SELECT`, `FROM` or `WHERE` clauses.

3. You would use a subquery to narrow down a result within a result or to retrieve data without fetchind duplicates.

4. A row constructor is the value retrieved from a subquery that forms a row of data.  It's similar to what is retrieved from a join.

5. It returns `NULL`

6. Use nested subqueries to further narrow down results.

7a.
```
SELECT v.*, (SELECT dogs.name as dog_name FROM dogs WHERE dogs.id = v.foster_dog_id)
FROM volunteers v;
```
|id|first_name|	last_name|	address|	phone_number|	available_to_foster	|foster_dog_id	|dog_name|
|:---|:---|:---|:---|:---|:---|:---|:---|
|1|	Albus|	Dumbledore|	99 Godric's Hollow|	843-746-3649|false|	(null)	|(null)|
|2|	Rubeus|	Hagrid|	1 Edge of Forbidden Forest	|256-667-2378	|true	|10002	|Munchkin|
|3	|Remus	|Lupin|	12 Grimmauld Place	|627-283-3771|	true	|(null)	|(null)|
|4|	Sirius|	Black|	12 Grimmauld Place	|878-666-4663	|true|	(null)	|(null)|
|5	|Marjorie	|Dursley	|1990 Next Door to Fubster	|463-528-2253	|true	|10006|	Marmaduke|

7b.
```
SELECT c.cat_name, c.adopter_name, c.adoption_date
FROM (SELECT cats.name as cat_name, adopters.first_name as adopter_name, ca.date as adoption_date
      FROM cat_adoptions ca
     JOIN cats
ON cats.id = ca.cat_id
JOIN adopters
ON adopters.id = ca.adopter_id) AS c
WHERE c.adoption_date < now() - interval '1 month';
```
|cat_name|	adopter_name|	adoption_date|
|:--|:--|:--|
|Azul|	Hermione|	2018-04-10|

7c.
```
SELECT dogs.name as dog_name, adopters.first_name as adopter_name
FROM dogs, adopters
WHERE adopters.id NOT IN (SELECT adopter_id FROM dog_adoptions) AND dogs.id NOT IN (SELECT dog_id FROM dog_adoptions);
```

|dog_name|	adopter_name|
|:--|:--|
|Boujee   | Hermione  |
| Boujee  | Arabella  |
|Munchkin|	Hermione|
|Munchkin	|Arabella|
|Marley|	Hermione|
|Marley	|Arabella|
|Lassie|	Hermione|
|Lassie	|Arabella|
|Marmaduke|	Hermione|
|Marmaduke	|Arabella|

7d.
```
SELECT dogs.name as dog_name, cats.name as cat_name
FROM dogs, cats
WHERE cats.id NOT IN (SELECT cat_id FROM cat_adoptions) AND dogs.id NOT IN (SELECT dog_id FROM dog_adoptions);
```

|dog_name|	cat_name|
|:---|:---|
|Boujee|Seashell|
|Munchkin|Seashell|
|Marley|Seashell|
|Lassie|Seashell|
|Marmaduke|Seashell|
|Boujee|Nala|
|Munchkin|Nala|
|Marley|Nala|
|Lassie|Nala|
|Marmaduke|Nala|

7e.
```
SELECT adopters.first_name as adopter_name
FROM dogs, adopters
WHERE adopters.id IN (SELECT adopter_id FROM dog_adoptions) AND dogs.id = 10007;
```
|adopter_name|
|:--:|
|Argus|

8a.
```
SELECT h.rank, p.name
FROM holds h
JOIN patrons p
ON p.id = h.patron_id
WHERE EXists (SELECT title FROM books WHERE isbn = h.isbn AND title = 'Advanced Potion-Making')
ORDER BY rank DESC;
```
|rank|name|
|:--:|:--:|
|2   |Cedric Diggory   |
|1   | Terry Boot  |

8b.
```
SELECT title
from books WHERE isbn IN
  (SELECT isbn
  FROM transactions
  WHERE checked_in_date IS null);
```
|title|
|:--:|
|Fantastic Beasts and Where to Find Them |
|Advanced Potion-Making   |

8c.
```
SELECT b.title, AVG(date(t.checked_in_date) - date(t.checked_out_date))
from transactions t
JOIN books b ON b.isbn = t.isbn
WHERE b.isbn IN
  (SELECT t.isbn
  FROM transactions
  WHERE checked_in_date IS NOT null AND checked_out_date < CURRENT_DATE + INTERVAL '1 Month')
  GROUP BY b.title;
 ```
|title|avg|
|:--|:--|
|Advanced Potion-Making|1|
|Fantastic Beasts and Where to Find Them	|2|
|Hogwarts: A History	|1|

8d.
```
SELECT b.title
from books b
WHERE b.isbn NOT IN
  (SELECT t.isbn
  FROM transactions t
  WHERE date_part('years', t.checked_out_date) > 2013)
  GROUP BY b.title;
```

|title|
|:--:|
|Hogwarts: A History|

8e.
```
SELECT p.*, b.title FROM (
  transactions t JOIN books b ON b.isbn = t.isbn
JOIN patrons p ON p.id = t.patron_id);
```

|id|	name|title|
|:---|:--|:--|
|1|Hermione Granger|Hogwarts: A History|
|4|Cho Chang|Advanced Potion-Making|
|2|Terry Boot|Fantastic Beasts and Where to Find Them|
|3|Padma Patil|Fantastic Beasts and Where to Find Them|
|2|Terry Boot|Advanced Potion-Making|
|1|Hermione Granger|Fantastic Beasts and Where to Find Them|
|5|Cedric Diggory|Fantastic Beasts and Where to Find Them|

9a.
```
SELECT a.model
from airplanes a
WHERE EXISTS
(SELECT t.seats_sold  FROM transactions t where t.date < now() - INTERVAL '1 MONTH');

```
|model|
|:--:|
|Boeing 777|
|Boeing 787|
|Airbus A330|
|Airbus A350|
|Airbus A380|

9b.
```
SELECT f.destination, f.origin
FROM flights f
WHERE EXISTS (
  SELECT ROUND(100.0 * (a.seat_capacity / t.seats_sold
    ),1) AS percent_total 
  FROM transactions t
  JOIN airplanes a ON a.model = 
  f.airplane_model
  WHERE t.date <= now() - interval '1 month' 
  AND ROUND(100.0 * (a.seat_capacity / t.seats_sold
    ),1) >= 10
);
```
|destination|origin|
|:---|:---|
|GRU|LAX|
|JFK|LHR|
|HKG|SFO|
|MAN|SIN|
|SIN|MEL|
|JNB|LHR|

9c. 
```
SELECT flight_number, total_revenue 
FROM transactions 
WHERE flight_number = ANY (
  SELECT flight_number
  FROM flights
  WHERE destination = 'SIN' OR origin = 'SIN'
);
```
|flight_number|total_revenue|
|:---|:---|
|7352|250394.7|
|7403|131992.12|


10.  I think it really depends, in a lot of situations I think that JOINs are easier to read, however when you only need to narrow something down within a `WHERE` clause, i can see that a subquery would be more beneficial.