
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_task.opened_on_key' ELSE 'SUCCESS' END as Message 
FROM gilead_mdwdb.f_task trgt
RIGHT JOIN gilead_mdsdb.task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 
WHERE  CASE WHEN src.sys_class_name ='sc_task' 
			THEN COALESCE(DATE_FORMAT(CONVERT_TZ(src.sys_created_on,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED')
			ELSE COALESCE(DATE_FORMAT(CONVERT_TZ(src.opened_at,'GMT','America/New_York'),'%Y%m%d'),'UNSPECIFIED')
			END
			<> opened_on_key
;