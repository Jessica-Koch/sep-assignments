1.  Aggregate Functions:


* `SUM` adds the results of a particular coumn together.
* `COUNT` provides the length of a particular column
* `MIN` gives minimum value in a column
* `MAX` opposite of `MIN`
* `AVG` returns the mean of specified column

---

2.

2a. `SELECT SUM(amount) from donations;`
  *  993

2b. `SELECT donor, SUM(amount) from donations GROUP BY donor;`

| donor      | amount |
| ---------- | ------ |
| Samwell    | 20     |
| Daario     | 10     |
| Brienne    | 75     |
| Tyrion     | 120    |
| Petyr      | 70     |
| Melisandre | 45     |
| Bran       | 25     |
| Tormund    | 50     |
| Ygritte    | 30     |
| Gilly      | 7      |
| Jon        | 25     |
| Arya       | 60     |
| Theon      | 20     |
| Bronn      | 20     |
| Margaery   | 120    |
| Missandei  | 90     |
| Sansa      | 33     |
| Daenerys   | 173    |

2c. `SELECT donor, AVG(amount) from donations GROUP BY donor;`

| donor      | amount |
|------------|--------|
| Samwell    | 20     |
| Daario     | 10     |
| Brienne    | 75     |
| Tyrion     | 40     |
| Petyr      | 70     |
| Melisandre | 45     |
| Bran       | 25     |
| Tormund    | 50     |
| Ygritte    | 30     |
| Gilly      | 7      |
| Jon        | 25     |
| Arya       | 20     |
| Theon      | 10     |
| Bronn      | 20     |
| Margaery   | 120    |
| Missandei  | 22.5   |
| Sansa      | 33     |
| Daenerys   | 86.5   |

2d. `SELECT count(amount)
  from donations
  WHERE amount > 100;`
    * 2

2e. `SELECT donor, MAX(distinct amount)
  from donations
  group by(donor);`

| donor      | max |
|------------|-----|
| Arya       | 30  |
| Bran       | 25  |
| Brienne    | 75  |
| Bronn      | 20  |
| Daario     | 10  |
| Daenerys   | 102 |
| Gilly      | 7   |
| Jon        | 25  |
| Margaery   | 120 |
| Melisandre | 45  |
| Missandei  | 30  |
| Petyr      | 70  |
| Samwell    | 20  |
| Sansa      | 33  |
| Theon      | 15  |
| Tormund    | 50  |
| Tyrion     | 60  |
| Ygritte    | 30  |

2.
 * `SELECT min(amount)
  from donations;`
  5

3.`ORDER BY`

4.If you use order by, you can eliminate items you presume occur affter a certain count or number.

5.Because you are effectively grouping the data and it is no longer in a random order.

6.Having is used to eliminate GROUPS and used in conjunction with a GROUP By clause, otherwise it works the same way.

7.`SELECT id, SUM (amount) from payment group by amount having sum(amount) > 200;`

8a. `SELECT * from cats order by intake_date;`


|id|name|gender|age|intake_date|adoption_date|
|------------|-----|----|---|----|----|
|1|	Mushi	|M	|1	|2016-01-09	|2016-03-22|
|2|	Seashell|	F|	7|	2016-01-09	|(null)|
|3|	Azul|	M	|3|	2016-01-11	|2016-04-17|
|4|	Victoire	|M	|7|	2016-01-11|	2016-09-01|
|5|	Nala|	F|	1|	2016-01-12|	(null)|

8b. `select cat, date
from adoptions
order by date desc
limit(5);`

| cat         | date       |
|-------------|------------|
| Crookshanks | 1993-08-31 |
| Mr. Tibbles | 1990-02-18 |
| Mr. Paws    | 1990-02-18 |
| Snowy       | 1989-11-29 |
| Tufty       | 1988-05-03 |

8c. `SELECT SUM(amount) as total, donor from donations
group by donor
order by total desc
limit 5;`

| total | donor     |
|-------|-----------|
| 173   | Daenerys  |
| 120   | Margaery  |
| 120   | Tyrion    |
| 90    | Missandei |
| 75    | Brienne   |

8d.`SELECT SUM(amount) as total, donor
FROM donations
GROUP BY donor
ORDER BY total DESC
OFFSET 5 LIMIT 15;`

| total | donor      |
|-------|------------|
| 70    | Petyr      |
| 60    | Arya       |
| 50    | Tormund    |
| 45    | Melisandre |
| 33    | Sansa      |
| 30    | Ygritte    |
| 25    | Jon        |
| 25    | Bran       |
| 20    | Samwell    |
| 20    | Theon      |
| 20    | Bronn      |
| 10    | Daario     |
| 7     | Gilly      |
