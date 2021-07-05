SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident_task_c.active_flag' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.d_incident_task_c trgt
RIGHT JOIN mcd_mdsdb.incident_task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE CASE WHEN src.active = 1 THEN 'Y' ELSE 'N' END <>trgt.active_flag
;