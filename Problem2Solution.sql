

--Solution 1:
with a as
(select *, row_number() over (order by id) an from Students_Table),
b as
(select *, row_number() over (order by Category) bn from Categories_Table)

select a.Name, b.Category, (CASE WHEN a.Score > 45 THEN 'Passed' WHEN a.Score < 45 THEN 'Failed'
 END) AS Result
from a
full outer join b on a.an = b.bn ORDER BY b.Category DESC

--Solution 2:
SELECT Name, 
       (CASE WHEN Score < 31 THEN 1 WHEN Score < 46 THEN 2 WHEN Score < 66 THEN 3 WHEN Score < 86 THEN 4 WHEN Score < 101 THEN 5 END) AS Category, 
       (CASE WHEN Score > 45 THEN 'Passed' WHEN Score < 45 THEN 'Failed'END) AS Result
 FROM Students_Table ORDER BY Category DESC