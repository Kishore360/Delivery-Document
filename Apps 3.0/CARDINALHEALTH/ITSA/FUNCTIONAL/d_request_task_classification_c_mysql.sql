SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'Failure' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT
from
cardinalhealth_mdsdb.sc_task_final a
join cardinalhealth_mdwdb.d_request_task b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
left join cardinalhealth_mdsdb.u_classification_final c
on c.sys_id=a.u_classification and a.sourceinstance=c.sourceinstance
where c.u_classification<>b.classification_c)temp;