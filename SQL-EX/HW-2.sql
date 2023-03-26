SELECT p.monarch AS '势力',COUNT(*) AS count
--设置需要显示的字段
FROM city c,political p
--指定来源
WHERE c.monarch_no IN(
    SELECT p.no
    WHERE p.no = 0
    --筛选对象字段为0
)
