SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM cardinalhealth_mdsdb.task_final SRC 
LEFT JOIN cardinalhealth_mdwdb.d_task_c TRGT 
ON (SRC.sys_id =TRGT.row_id     
AND SRC.sourceinstance= TRGT.source_id     )
WHERE 
CONCAT('<a href=\"','https://cardinal.service-now.com/nav_to.do?uri=',SRC.sys_class_name,'.do?sys_id=',SRC.sys_id,'\" target=\"_blank\">',SRC.number,'</a>')
 <> source_url)temp;
 