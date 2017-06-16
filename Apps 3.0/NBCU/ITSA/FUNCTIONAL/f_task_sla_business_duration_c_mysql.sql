SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from nbcu_mdwdb.f_task_sla a join nbcu_mdsdb.task_sla_final b
 on a.row_id=b.sys_id and a.source_id=b.sourceinstance
 where a.business_duration_c <> CASE WHEN b.business_duration is null  THEN NULL
	 WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',b.business_duration) < 0 THEN NULL
	  WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',b.business_duration) > 214748364 THEN NULL 
	  ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',b.business_duration) end 
	  
	  