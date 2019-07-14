SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_sla_analysis_c.sla_category' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from (select sys_id, sourceinstance,cdctime from  mcdonalds_mdsdb.task_final where sys_class_name='incident') src 
 join (select sys_id, sourceinstance from  mcdonalds_mdsdb.incident_final) src1 on src.sys_id=src1.sys_id and src.sourceinstance=src1.sourceinstance
 join (select sys_id, sla,task,pause_time,sourceinstance  from mcdonalds_mdsdb.task_sla_final) c on src.sys_id=c.task and src.sourceinstance=c.sourceinstance
 join (select sys_id, type,sourceinstance from mcdonalds_mdsdb.contract_sla_final) d on c.sla=d.sys_id and src.sourceinstance=d.sourceinstance
 join mcdonalds_mdwdb.d_sla_analysis_c trgt on CONCAT(src.sys_id,'~',(c.sla),'~',(c.sys_id))=trgt.row_id  and src.sourceinstance=trgt.source_id
 join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and  (d.type ) <> trgt.sla_category) temp;