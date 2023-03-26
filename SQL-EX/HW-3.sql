CREATE VIEW Homework3 AS
SELECT a.monarch AS '勢力', COUNT(b.monarch_no) AS '支配都市個数'
FROM political a
LEFT JOIN city b ON a.no = b.monarch_no
GROUP BY a.monarch
ORDER BY a.no
