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

2c.
|  donor| amount|
| ---------- | ------ |
| Samwell|20          |
|Daario|10|
|Brienne|75|
|Tyrion|40|
|Petyr|70|
|Melisandre|45|
|Bran|25|
|Tormund|50|
|Ygritte|30|
|Gilly|7|
|Jon|25|
|Arya|20|
|Theon|10|
|Bronn|20|
|Margaery|120|
|Missandei|22.5|
|Sansa|33|
|Daenerys|86.5|
