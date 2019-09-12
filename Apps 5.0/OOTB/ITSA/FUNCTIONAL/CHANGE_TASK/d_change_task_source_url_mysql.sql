
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task.source_url' ELSE 'SUCCESS' END as Message
FROM tjx_mdsdb.task_final SRC 
LEFT JOIN tjx_mdwdb.d_task TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE concat('<a href="https://#URL/','task','.do?sys_id=',COALESCE(`sys_id`,'')
,'" target="_blank" >',COALESCE(`number`,''),'</a>')
<> COALESCE(TRGT.source_url ,'')