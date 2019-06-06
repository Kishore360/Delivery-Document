
			

				select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.age_key' ELSE 'SUCCESS' END as Message
from
mercury_mdwdb.f_task_sla stg
JOIN mercury_mdsdb.task_sla_final tsd ON stg.row_id = tsd.sys_id 
 AND stg.source_id = tsd.sourceinstance
where	
stg.end_time_c<>tsd.end_time ;

