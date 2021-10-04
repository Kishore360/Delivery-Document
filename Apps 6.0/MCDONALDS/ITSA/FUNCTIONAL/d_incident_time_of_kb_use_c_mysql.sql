SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_incident.time_of_kb_use_c' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from ((SELECT a11.task,a11.sourceinstance,CONVERT_TZ(min(a11.sys_created_on),'GMT','US/Central') as created_on , 
a11.cdctime
from mcd_mdsdb.m2m_kb_task_final a11
JOIN mcd_mdsdb.kb_knowledge_final a12 ON a11.kb_knowledge = a12.sys_id and a11.sourceinstance = a12.sourceinstance
group by 1,2) src
left join mcd_mdwdb.d_incident trgt on src.task=trgt.row_id and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1 
on (f1.source_id = src.sourceinstance))
where (src.cdctime<=f1.lastupdated) and src.created_on <> trgt.time_of_kb_use_c) temp;