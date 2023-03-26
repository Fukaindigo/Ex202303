--曹操手下武将五维顺序


CREATE VIEW Homework4 AS
--创建view
SELECT g.no, g.name, g.status,
    (g.control + g.power + g.glamour + g.intelligence + g.politics) AS fiveData,
    g.control , g.power , g.glamour , g.politics ,g.intelligence
--选择需要显示的列名

FROM generals g
--从武将数据中选出

INNER JOIN city c 
    on g.owner = c.name
    JOIN political p on c.monarch_no = p.no
--将C表数据与G表将武将所属地关联起来，再将对应的所属地的归属势力代号的关联起来
--实现了武将和所属势力的关联
    
WHERE c.monarch_no = 0
--筛选出势力代码为0 即曹操手下的武将

AND g.status NOT IN ('未登場', '未発見', '在野', '死亡')
--剔除出异常状态数据

ORDER BY fiveData DESC;
--按照五维合排序，从大到小
