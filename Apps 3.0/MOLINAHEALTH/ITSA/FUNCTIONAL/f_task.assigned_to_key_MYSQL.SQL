
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_task.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM 
( SELECT Count(1) AS CNT 
FROM (SELECT sys_id,sourceinstance,ASSIGNED_TO FROM molinahealth_mdsdb.task_final where sys_class_name='INCIDENT') SRC 
 JOIN molinahealth_mdwdb.f_task TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN molinahealth_mdwdb.d_internal_contact LKP ON ( CONCAT('INTERNAL_CONTACT~',SRC.ASSIGNED_TO) = LKP.row_id AND SRC.sourceinstance=LKP.source_id )
WHERE   COALESCE(LKP.row_key,CASE WHEN SRC.assigned_to IS NULL THEN 0 else -1 end)<> TRGT.assigned_to_key  
) a; 


