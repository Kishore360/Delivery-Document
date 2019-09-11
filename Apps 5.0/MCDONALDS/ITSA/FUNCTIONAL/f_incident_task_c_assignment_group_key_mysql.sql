SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_incident_task_c.assignment_group_key' ELSE 'SUCCESS' END as Message 
FROM mcdonalds_mdwdb.f_incident_task_c trgt
RIGHT JOIN mcdonalds_mdsdb.incident_task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN mcdonalds_mdwdb.d_internal_organization lkp
ON COALESCE(CONCAT('GROUP~',src.assignment_group),'UNSPECIFIED') = lkp.row_id and src.sourceinstance = lkp.source_id
WHERE COALESCE(lkp.row_key,CASE WHEN src.assignment_group IS NULL THEN 0 else -1 end) <> assignment_group_key
;
