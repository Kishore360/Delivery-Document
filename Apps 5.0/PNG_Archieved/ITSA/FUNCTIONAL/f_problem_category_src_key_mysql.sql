SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
png_mdsdb.problem_final a
join png_mdwdb.f_problem b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join png_mdwdb.d_lov c
on c.row_id=COALESCE( CONCAT('CATEGORY_C','~','PROBLEM','~','~','~',UPPER(a.u_pg_category )),'UNSPECIFIED')
and a.sourceinstance=c.source_id
where coalesce(c.row_key,case when a.u_pg_category is null then 0 else -1 end )<>b.category_src_key;




