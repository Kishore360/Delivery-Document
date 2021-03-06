SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from
cardinalhealth_mdsdb.problem_final a
join cardinalhealth_mdwdb.f_problem b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join cardinalhealth_mdwdb.d_configuration_item c
on COALESCE(a.u_affected_configuration_item,'UNSPECIFIED')=c.row_id and a.sourceinstance=c.source_id
where c.row_key<>b.affected_configuration_item_c_key)temp;
 