SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from
cardinalhealth_mdsdb.problem_final a
join cardinalhealth_mdwdb.f_problem b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join cardinalhealth_mdwdb.d_lov c
on c.row_id=COALESCE( CONCAT('CATEGORY','~','PROBLEM','~','~','~',UPPER(a.u_category )),'UNSPECIFIED')
and a.sourceinstance=c.source_id
where c.row_key<>b.category_src_key)temp;
