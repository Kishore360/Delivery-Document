
SELECT CASE 
         WHEN Count(1) > 0 THEN 'FAILURE' 
         ELSE 'SUCCESS' 
       END AS Result, 
       CASE 
         WHEN Count(1) > 0 THEN 
         'MDS to DWH data validation failed for f_change_request.failure_flag' 
         ELSE 'SUCCESS' 
       END AS Message 
FROM     intuit_mdwdb.f_change_task trgt
JOIN intuit_mdsdb.change_task_final src
ON trgt.source_id = src.sourceinstance and trgt.row_id = src.sys_id
WHERE TIMESTAMPDIFF(SECOND,src.WORK_START,src.WORK_END)<> trgt.ACTUAL_DURATION;