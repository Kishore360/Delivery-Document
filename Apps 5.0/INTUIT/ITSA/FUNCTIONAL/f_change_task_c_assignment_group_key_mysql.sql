SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdwdb.f_change_task  trgt
JOIN intuit_mdsdb.change_task_final src
ON trgt.source_id = src.sourceinstance and trgt.row_id = src.sys_id
LEFT JOIN intuit_mdwdb.d_internal_organization  lkp 
on lkp.row_id = COALESCE(CONCAT('GROUP~',src.ASSIGNMENT_GROUP),'UNSPECIFIED') and lkp.source_id = trgt.source_id
where COALESCE(lkp.row_key,CASE WHEN ASSIGNMENT_GROUP is NULL THEN 0 ELSE -1 END)<> trgt.assignment_group_key;


