

				select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.age_key' ELSE 'SUCCESS' END as Message
from
mercuryins_mdwdb.f_task_sla stg
JOIN mercuryins_mdsdb.task_sla_final tsd ON stg.row_id = tsd.sys_id 
 AND stg.source_id = tsd.sourceinstance
 left join mercuryins_mdsdb.cmn_schedule_final c on tsd.schedule=c.sys_id and tsd.sourceinstance =c.sourceinstance
where	
stg.schedule_name_c<> coalesce(c.name,'UNSPECIFIED')

