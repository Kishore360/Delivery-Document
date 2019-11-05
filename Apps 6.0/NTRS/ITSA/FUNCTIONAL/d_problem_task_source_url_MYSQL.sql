SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_problem_task.source_url' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT 
FROM ntrs_mdsdb.u_problem_task_final SRC 
LEFT JOIN ntrs_mdwdb.d_problem_task TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE CONCAT('<a href=\"','<<snow_url>>nav_to.do?uri=','\/problem_task.do?sys_id=',SRC.sys_id,'\" target=\"_blank\">',SRC.number,'</a>')<>TRGT.source_url
AND SRC.cdctype='X' ) temp; 



