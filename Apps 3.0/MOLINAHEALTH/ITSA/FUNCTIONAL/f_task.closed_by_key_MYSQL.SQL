
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_task.closed_by_key' ELSE 'SUCCESS' END as Message
FROM 
( 
SELECT Count(1) AS CNT 
FROM (select sys_id,sourceinstance,closed_by,sys_updated_by from molinahealth_mdsdb.task_final where sys_class_name='INCIDENT') SRC 
LEFT JOIN molinahealth_mdwdb.f_task TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN molinahealth_mdwdb.d_internal_contact LKP ON ( CONCAT('INTERNAL_CONTACT~',SRC.closed_by) = (LKP.row_id ) AND SRC.sourceinstance = LKP.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else -1 end)<> TRGT.closed_by_key 
) a; 






