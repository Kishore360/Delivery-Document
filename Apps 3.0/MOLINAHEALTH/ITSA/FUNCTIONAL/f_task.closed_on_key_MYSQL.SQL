
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_task.closed_on_key' ELSE 'SUCCESS' END as Message
FROM 
( 
SELECT Count(1) AS CNT 
FROM molinahealth_mdsdb.task_final SRC
LEFT JOIN molinahealth_mdwdb.f_task TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN molinahealth_mdwdb.d_calendar_date LKP 
ON(LKP.row_id = date_format(convert_tz(SRC.closed_at,'GMT','America/Los_Angeles'),'%Y%m%d') and LKP.source_id=0)
LEFT JOIN molinahealth_mdwdb.d_lov_map LM
ON (SRC.state=LM.dimension_code AND SRC.sourceinstance=LM.source_id AND LM.dimension_class = 'STATE~TASK' )
WHERE CASE WHEN LM.dimension_wh_code='CLOSED' THEN (COALESCE(LKP.row_key,CASE WHEN SRC.closed_at IS NULL THEN 0 else -1 end)) else '' END <> 
TRGT.closed_on_key
) a; 






 




   