SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM 
(SELECT Count(1) as CNT  
FROM aetna_mdsdb.incident_final SRC 
LEFT JOIN aetna_mdwdb.f_incident TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN aetna_mdwdb.d_change_request LKP 
ON COALESCE(SRC.caused_by,SRC.u_temp_remedy_change,'UNSPECIFIED') = LKP.row_id AND SRC.sourceinstance= LKP.source_id 
WHERE TRGT.soft_deleted_flag='N'
AND COALESCE(LKP.row_key,CASE WHEN SRC.caused_by IS NULL and SRC.u_temp_remedy_change IS NULL THEN 0 else -1 end)<> TRGT.caused_by_change_key
) temp;
 
 
