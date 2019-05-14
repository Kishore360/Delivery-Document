SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM 
(
 SELECT Count(1) as CNT 
 FROM aetna_mdsdb.incident_final SRC 
 LEFT JOIN aetna_mdwdb.d_incident TRGT 
 ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id  )
 WHERE SRC.u_job_process_id <> TRGT.u_job_process_id and SRC.cdctype<>'D'
 AND TRGT.soft_deleted_flag='N'
 ) temp;
 