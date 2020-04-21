
SELECT CASE WHEN cnt  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt  THEN 'MDS to DWH data validation failed for f_task.opened_on_key' ELSE 'SUCCESS' END as Message 
from
(
select count(1)cnt from
(select CASE WHEN src.sys_class_name ='sc_task' 
			THEN DATE_FORMAT(CONVERT_TZ(src.sys_created_on,'GMT','America/New_York'),'%Y%m%d')
			ELSE DATE_FORMAT(CONVERT_TZ(src.opened_at,'GMT','America/New_York'),'%Y%m%d')
			END opened_on_key_src
			, opened_on_key
FROM gilead_mdsdb.task_final src
JOIN gilead_mdwdb.f_task trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id  and src.sys_class_name ='sc_task' )a
WHERE  opened_on_key_src<>opened_on_key)a
;