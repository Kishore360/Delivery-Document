 

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_request_task.opened_on' ELSE 'SUCCESS' END as Message 
FROM gilead_mdwdb.d_request_task trgt
RIGHT JOIN gilead_mdsdb.sc_task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
WHERE  CONVERT_TZ(src.sys_created_on,'GMT','America/New_York') <> opened_on
;