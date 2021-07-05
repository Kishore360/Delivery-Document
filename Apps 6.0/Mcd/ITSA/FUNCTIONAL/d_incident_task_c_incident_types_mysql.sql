SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident_task_c.incident_type' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.d_incident_task_c trgt
RIGHT JOIN mcd_mdsdb.incident_task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
where src.u_incident_type <> trgt.incident_type

;