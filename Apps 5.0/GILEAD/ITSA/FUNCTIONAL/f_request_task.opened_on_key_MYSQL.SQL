
 
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_task.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM gilead_mdsdb.sc_task_final SRC 
JOIN gilead_mdwdb.f_request_task TRGT ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id)
JOIN gilead_mdwdb.d_calendar_date LKP 
ON (Date_format(convert_tz(SRC.sys_created_on,'GMT','America/New_York'),'%Y%m%d')=LKP.row_id and LKP.source_id=0)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.sys_created_on IS NULL THEN 0 ELSE -1 END,'UNSPECIFIED')<>TRGT.opened_on_key
)temp;
