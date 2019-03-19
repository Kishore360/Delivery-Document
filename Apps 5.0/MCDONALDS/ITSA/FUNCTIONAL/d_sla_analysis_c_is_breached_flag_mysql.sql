SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_sla_analysis_c.priority_src_code' ELSE 'SUCCESS' END as Message
from (select count(1)cnt from
(select a1.priority , trgt.priority_src_code,a1.sys_id,a1.s2,a1.t,a1.s from 
(select case when c.has_breached='TRUE' then 'Y' else 'N' end as is_breached_flag,CONCAT(src.sys_id,'~',c.sla,'~',c.sys_id) xyz, src1.priority priority,src1.sys_id sys_id,src.sys_id s2,c.task t,c.sla s
from (select sys_id, sourceinstance,priority from   mcdonalds_mdsdb.incident_final where CDCTYPE<>'D') src1 
join (select sys_id, sourceinstance,cdctime from   mcdonalds_mdsdb.task_final where sys_class_name='incident' and CDCTYPE<>'D') src 
on src.sys_id=src1.sys_id and src.sourceinstance=src1.sourceinstance
 join (select sys_id, sla,task,sourceinstance,has_breached  from   mcdonalds_mdsdb.task_sla_final where CDCTYPE<>'D') c on src.sys_id=c.task 
 and c.sourceinstance=src1.sourceinstance
 -- join (select sys_id,sourceinstance from   mcdonalds_mdsdb.contract_sla_final where CDCTYPE<>'D') d on c.sla=d.sys_id  and d.sourceinstance=src1.sourceinstance
 -- and d.sourceinstance=c.sourceinstance
 join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1
 on (f1.source_id = src.sourceinstance) -- where src1.sys_id='02eb897adb8f1f046a1c790aaf9619d4'
 -- and c.sla='09ccae7c4f311200dd83afdd0210c76f'
 -- and c.sys_id='92eb0dfadb8f1f046a1c790aaf961970'
 and  (src.cdctime<=f1.lastupdated))a1
 join   mcdonalds_mdwdb.d_sla_analysis_c trgt on  a1.xyz =trgt.row_id
  where trgt.soft_deleted_flag='N'  and  a1.is_breached_flag <> trgt.is_breached_flag)a) temp;
  
  
  
  
  