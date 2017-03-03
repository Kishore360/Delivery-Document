
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_task.source_url' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.task_final SRC 
LEFT JOIN cardinalhealth_mdwdb.d_task TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE CONCAT('<a href=\"','https://cardinal.service-now.com/nav_to.do?uri=',SRC.sys_class_name,'.do?sys_id=',SRC.sys_id,'\" target=\"_blank\">',SRC.number,'</a>')
<> COALESCE(TRGT.source_url ,'')