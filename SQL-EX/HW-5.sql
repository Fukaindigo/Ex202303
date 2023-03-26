CREATE VIEW Homework5 AS
SELECT p.no AS '勢力番号',
    p.monarch AS '君主',
    g.name AS '武将名',
    (g.control + g.power + g.intelligence + g.politics + g.glamour) AS '五囲',
    g.control AS '統御',
    g.power AS '武力',
    g.intelligence AS '智力',
    g.politics AS '政治',
    g.glamour AS '魅力'
FROM generals g
INNER JOIN city c ON g.owner = c.name 
    JOIN political p ON c.monarch_no = p.no

WHERE g.no IN (SELECT no FROM generals WHERE owner IN 
                 (SELECT name FROM city WHERE monarch_no = p.no)
                 AND status NOT IN ('未登場', '未発見', '在野', '死亡')
                 ORDER BY (control + power + intelligence + politics + glamour) DESC
                 LIMIT 5)
--插入了一个子查询
--子查询部分使用了主查询中的p.no值作为条件，查询出对应势力下五维最高的五个武将的编号，然后在主查询中使用IN语句筛选出这五个武将的信息
--直接筛除掉了不符合条件的武将信息

ORDER BY p.no,五囲 DESC;


