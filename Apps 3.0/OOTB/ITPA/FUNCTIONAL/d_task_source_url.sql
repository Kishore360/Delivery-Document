
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task.source_url' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.task_final SRC 
LEFT JOIN <<tenant>>_mdwdb.d_task TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE concat('<a href="https://#URL/',replace('#MDS_TABLE_NAME','_final',''),'.do?sys_id=',COALESCE(`sys_id`,'')
,'" target="_blank" title="Check in ServiceNow"><img src=../images/Numerify/snow_url_image.png></a>')
<> COALESCE(TRGT.source_url ,'')
