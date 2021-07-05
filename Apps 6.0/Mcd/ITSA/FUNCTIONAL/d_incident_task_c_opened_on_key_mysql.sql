SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident_task_c.opened_on_key' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.f_incident_task_c trgt
RIGHT JOIN mcd_mdsdb.incident_task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id

WHERE trgt.opened_on_key  <> COALESCE(DATE_FORMAT(CONVERT_TZ(COALESCE(src.opened_at),'GMT','US/Central'),'%Y%m%d'),0)
;
