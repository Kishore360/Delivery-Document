SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_incident_task_c.state_src_key' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdwdb.d_incident_task_c trgt
RIGHT JOIN mcdonalds_mdsdb.incident_task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN mcdonalds_mdwdb.d_lov lkp
ON COALESCE(CONCAT('STATE~INCIDENT_TASK~~~',src.state),'UNSPECIFIED') =lkp.row_id and src.sourceinstance = lkp.source_id
WHERE COALESCE(lkp.row_key,CASE WHEN src.state IS NULL THEN 0 else -1 end) <> trgt.state_src_key
;
