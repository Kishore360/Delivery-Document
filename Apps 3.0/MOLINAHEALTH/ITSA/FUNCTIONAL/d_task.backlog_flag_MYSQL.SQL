
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_task.backlog_flag' ELSE 'SUCCESS' END as Message
FROM 
( 
SELECT count(1) as CNT 
FROM molinahealth_mdsdb.task_final SRC 
LEFT JOIN molinahealth_mdwdb.d_task TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN molinahealth_mdwdb.d_lov_map LKP ON TRGT.state_src_key=LKP.src_key
WHERE  
(CASE WHEN LKP.dimension_class 
IN 
(
'REQUEST_STATE~SC_REQUEST',
'STATE~CHANGE_REQUEST',
'STATE~TASK',
'STATE~INCIDENT',
'STATE~PROBLEM',
'STATE~SC_REQ_ITEM',
'STATE~SC_TASK'
 ) 
AND LKP.dimension_wh_code NOT IN ('RESOLVED','CLOSED') THEN 'Y' ELSE 'N' END)<>TRGT.backlog_flag
) a; 




