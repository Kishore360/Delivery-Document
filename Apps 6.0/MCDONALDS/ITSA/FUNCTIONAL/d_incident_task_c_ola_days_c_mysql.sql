SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident_task_c.ola_days_c' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.d_incident_task_c trgt
RIGHT JOIN mcd_mdsdb.incident_task_final src
ON src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE src.u_ola_days <> trgt.ola_days_c
;