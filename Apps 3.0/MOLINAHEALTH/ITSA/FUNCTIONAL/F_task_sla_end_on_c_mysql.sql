
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for F_task_sla.end_on_c    ' ELSE 'SUCCESS' END as Message 
FROM molinahealth_mdwdb.f_task_sla trgt
RIGHT JOIN molinahealth_mdsdb.task_sla_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE CONVERT_TZ(src.end_time,'GMT','America/Los_Angeles') <> coalesce(end_on_c,' ')
;