SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from cardinalhealth_mdsdb.problem_final i
left JOIN cardinalhealth_mdwdb.d_problem d
on d.row_id=i.sys_id and d.source_id=i.sourceinstance
where i.short_description <> d.short_description)temp;








