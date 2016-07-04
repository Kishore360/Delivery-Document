
select 1 from
(SELECT row_key FROM <<tenant>>_mdwdb.<<tablename>> 
WHERE soft_deleted_flag='N'
UNION
SELECT -2) A
ORDER BY row_key

