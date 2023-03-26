--直接用已知的no调取
UPDATE generals SET status = '一般' WHERE no = 288;


--不明白为什么跑不起来的版本
DECLARE @a int , @b varchar(10);
SET @b:= '諸葛亮';
SET @a:= (SELECT no FROM generals WHERE name = @b);
UPDATE generals SET status = '一般' WHERE no = @a;
