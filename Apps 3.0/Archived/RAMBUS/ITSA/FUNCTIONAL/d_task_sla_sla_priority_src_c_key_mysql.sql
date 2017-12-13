SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_incident.has_breached_update_c_flag' ELSE 'SUCCESS' END as Message 
FROM (SELECT count(1) as cnt 
from 
rambus_mdsdb.contract_sla_final task_sla 
 left JOIN rambus_mdwdb.d_lov LKP 
 ON ((CASE WHEN LOCATE('priority',start_condition) >0 THEN CONCAT('PRIORITY~TASK~~~',SUBSTRING(start_condition FROM (LOCATE('priority',start_condition)+9)FOR 1)) 
ELSE 'UNSPECIFIED' END)= LKP.row_id 
AND task_sla.sourceinstance= LKP.source_id)
join rambus_mdwdb.d_task_sla a on a.row_id=task_sla.sys_id and a.source_id=task_sla.sourceinstance
where 
a.sla_priority_src_c_key<>coalesce(LKP.row_key,case when LOCATE('priority',start_condition) = 'UNSPECIFIED' then 0 else -1 end ))temp;


