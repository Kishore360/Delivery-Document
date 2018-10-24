SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident_task_c.date_to_be_fixed' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdwdb.d_incident_task_c trgt
RIGHT JOIN mcdonalds_mdsdb.incident_task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
where CONVERT_TZ(COALESCE(src.u_date_to_be_fixed),'GMT','US/Central') <> trgt.date_to_be_fixed
;