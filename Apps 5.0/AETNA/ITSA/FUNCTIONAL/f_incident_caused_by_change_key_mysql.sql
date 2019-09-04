SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM 
(SELECT Count(1) as CNT  
FROM aetna_mdsdb.incident_final SRC 
 JOIN aetna_mdwdb.f_incident TRGT ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance= TRGT.source_id  )
LEFT JOIN aetna_mdsdb.change_request_final LKP 
ON TRIM(LEADING '0' FROM REPLACE(u_temp_caused_by,'CHG',0)) = TRIM(LEADING '0' FROM REPLACE(LKP.number,'CHG',0))  
AND SRC.sourceinstance= LKP.sourceinstance 
 JOIN aetna_mdwdb.d_change_request LKP1 on LKP.sys_id=LKP1.row_id and LKP.sourceinstance=LKP1.source_id 
WHERE TRGT.soft_deleted_flag='N'
AND COALESCE(LKP1.row_key,CASE WHEN SRC.caused_by IS NULL
 and TRIM(LEADING '0' FROM REPLACE(u_temp_caused_by,'CHG',0))  IS not  NULL
 and LKP.sys_id is null
 THEN -1 else COALESCE(SRC.caused_by,LKP.sys_id,'UNSPECIFIED') END )<> TRGT.caused_by_change_key
) temp;
 
 
