SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident_task_c.business_duration' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.f_incident_task_c trgt
RIGHT JOIN mcd_mdsdb.incident_task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id

WHERE trgt.business_duration <> CASE WHEN src.business_duration IS NULL  THEN NULL   
	 WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.business_duration) < 0 THEN NULL    
	 ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',src.business_duration) END
;