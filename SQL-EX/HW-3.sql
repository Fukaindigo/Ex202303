CREATE VIEW Homework3 AS
SELECT a.monarch AS , COUNT(b.monarch_no) AS 
FROM political a
LEFT JOIN city b ON a.no = b.monarch_no
GROUP BY a.monarch
ORDER BY a.no
