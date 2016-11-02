
 
 
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1) >0 THEN 
'MDS to DWH data validation failed for f_task_ci_c.change_request_key' ELSE 'SUCCESS' END as Message 
FROM tivo_mdsdb.task_ci_final SRC 
JOIN tivo_mdwdb.f_task_ci_c TRGT 
ON (SRC.sys_id =TRGT.f.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
join tivo_mdwdb.d_change_request lkp
on SRC.task=lkp.f.row_id and SRC.sourceinstance = lkp.source_id
WHERE COALESCE(lkp.row_key,CASE WHEN SRC.task IS NULL THEN 0 else -1 end) <> TRGT.change_request_key

