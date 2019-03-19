SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_sla_analysis_c.state_src_code' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from (select sys_id, sourceinstance,cdctime from  mcdonalds_mdsdb.task_final) src 
left join (select sys_id, sourceinstance,state from  mcdonalds_mdsdb.incident_final) src1 on src.sys_id=src1.sys_id and src.sourceinstance=src1.sourceinstance
left join (select sys_id, sla,task  from mcdonalds_mdsdb.task_sla_final) c on src.sys_id=c.task
left join (select sys_id from mcdonalds_mdsdb.contract_sla_final) d on c.sla=d.sys_id 
left join mcdonalds_mdwdb.d_sla_analysis_c trgt on CONCAT(src.sys_id,'~',COALESCE(c.sla,'UNSPECIFIED'),'~',COALESCE(c.sys_id,'UNSPECIFIED'))=trgt.row_id
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and  COALESCE(src1.state,'UNSPECIFIED') <> trgt.state_src_code) temp;