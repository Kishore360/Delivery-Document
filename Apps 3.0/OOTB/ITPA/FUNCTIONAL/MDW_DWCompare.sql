
select 1 from
(SELECT row_key,trim(#COL_NAME) as #COL_NAME FROM <<tenant>>_mdwdb.<<tablename>> 
WHERE soft_deleted_flag='N'
UNION
SELECT -2,null) A
ORDER BY row_key,#COL_NAME

