select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.age_key' ELSE 'SUCCESS' END as Message
from
mercury_mdwdb.f_task_sla stg
JOIN mercury_mdsdb.task_sla_final task_sla ON stg.row_id = task_sla.sys_id 
 AND stg.source_id = task_sla.sourceinstance
where stg.time_left_c <>  CASE 
                WHEN task_sla.time_left is null  THEN NULL   
                WHEN TIMESTAMPDIFF(SECOND,
                '1970-01-01 00:00:00',
                task_sla.time_left) < 0 THEN NULL    
                WHEN TIMESTAMPDIFF(SECOND,
                '1970-01-01 00:00:00',
                task_sla.time_left) > 214748364 THEN NULL     
                ELSE TIMESTAMPDIFF(SECOND,
                '1970-01-01 00:00:00',
                task_sla.time_left) end;
				
				