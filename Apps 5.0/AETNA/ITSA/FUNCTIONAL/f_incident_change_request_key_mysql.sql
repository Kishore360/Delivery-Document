/* SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM aetna_mdsdb.incident_final SRC 
JOIN aetna_mdwdb.f_incident TRGT ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id )
LEFT JOIN aetna_mdsdb.change_request_final cr
ON SRC.u_temp_remedy_change = cr.number 
LEFT JOIN aetna_mdwdb.d_change_request LKP 
 ON COALESCE(SRC.rfc,cr.sys_id,'UNSPECIFIED') = LKP.row_id AND SRC.sourceinstance= LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.rfc IS NULL and cr.sys_id is NULL THEN 0 else '-1' end)<> TRGT.change_request_key */

 

 SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
(
SELECT Count(1) as CNT 
FROM aetna_mdsdb.incident_final SRC 
LEFT JOIN aetna_mdsdb.change_request_final cr ON (SRC.u_temp_remedy_change=cr.number AND SRC.sourceinstance=cr.sourceinstance)
LEFT JOIN aetna_mdwdb.f_incident TRGT ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id )
JOIN aetna_mdwdb.d_change_request LKP ON (cr.sys_id =LKP.row_id AND cr.sourceinstance=LKP.source_id)
WHERE TRGT.soft_deleted_flag='N'
AMD COALESCE(LKP.row_key,CASE WHEN SRC.u_temp_remedy_change IS NULL THEN 0 else -1 end)<>TRGT.change_request_key
) temp;
