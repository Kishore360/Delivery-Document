SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.impact_src_code' 
ELSE 'MDS to DWH data validation passed for f_incident.impact_src_code' END as Message from 
(select count(1) cnt 
from
equifax_mdsdb.task_ci_final a
join
equifax_mdwdb.f_task_ci_c b
on a.sys_id=b.row_id and a.sourceinstance=b.source_id
join
equifax_mdwdb.d_request_item c
on COALESCE(a.task,'UNSPECIFIED')=c.row_id and a.sourceinstance=c.source_id
where  coalesce(c.row_key,case when a.task is null then 0 else -1 end ) <> b.task_ci_request_item_c_key and a.cdctype<>'D'
)b