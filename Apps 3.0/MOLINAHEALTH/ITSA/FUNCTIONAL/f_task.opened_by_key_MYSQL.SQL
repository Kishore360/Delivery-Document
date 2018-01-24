
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_task.opened_by_key' ELSE 'SUCCESS' END as Message
FROM 
( 
SELECT Count(1) AS CNT 
FROM molinahealth_mdsdb.task_final SRC 
LEFT JOIN molinahealth_mdwdb.f_task TRGT  ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN molinahealth_mdwdb.d_internal_contact LKP ON ( CONCAT('INTERNAL_CONTACT~',SRC.opened_by) = LKP.row_id AND SRC.sourceinstance=LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_by IS NULL THEN 0 else -1 end)<> TRGT.opened_by_key 
) a; 









   
