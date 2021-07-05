SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident_task_c.location_key' ELSE 'SUCCESS' END as Message 
FROM mcd_mdwdb.f_incident_task_c trgt
RIGHT JOIN   mcd_mdsdb.incident_task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN mcd_mdwdb.d_location lkp ON  COALESCE(src.location,'UNSPECIFIED')= lkp.row_id and src.sourceinstance = lkp.source_id
WHERE COALESCE(lkp.row_key,CASE WHEN src.location IS NULL THEN 0 else -1 end) <> trgt.location_key
;