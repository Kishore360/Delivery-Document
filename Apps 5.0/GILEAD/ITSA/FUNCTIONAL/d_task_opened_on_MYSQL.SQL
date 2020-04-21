

SELECT CASE WHEN cnt  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt  THEN 'MDS to DWH data validation failed for d_task.opened_on' ELSE 'SUCCESS' END as Message from
(
select count(1) cnt from 
 (

select  CASE WHEN src.sys_class_name ='sc_task' 
			THEN CONVERT_TZ(src.sys_created_on,'GMT','America/New_York')
			ELSE CONVERT_TZ(src.opened_at,'GMT','America/New_York')
			END
			, opened_on
FROM gilead_mdwdb.d_task trgt
 JOIN gilead_mdsdb.task_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id and src.sys_class_name ='sc_task' 
WHERE  CASE WHEN src.sys_class_name ='sc_task' 
			THEN CONVERT_TZ(src.sys_created_on,'GMT','America/New_York')
			ELSE CONVERT_TZ(src.opened_at,'GMT','America/New_York')
			END
			<> opened_on)a)b
;