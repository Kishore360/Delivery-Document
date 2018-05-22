SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.has_breached_update_c_flag' ELSE 'SUCCESS' END as Message from 
 (SELECT count(1) as CNT FROM
from (select * from <<tenant>>_mdsdb.task_sla_final where cdctype<>'D') task_sla 
join <<tenant>>_mdwdb.f_task_sla a on a.row_id=task_sla.sys_id and a.source_id=task_sla.sourceinstance
left join (select source_id,max(lastupdated) as lastupdated from <<tenant>>_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (task_sla.cdctime<=f1.lastupdated) and 
task_sla.sys_updated_by <> CHANGED_BY)temp;



