SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for sc_request_final.opened_by_key' ELSE 'SUCCESS' END as  Message
FROM 
(
SELECT Count(1) AS CNT 
FROM nbcu_mdsdb.sc_request_final SRC 
JOIN nbcu_mdwdb.f_request TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN nbcu_mdwdb.d_internal_contact LKP ON (COALESCE(CONCAT('INTERNAL_CONTACT','~',SRC.opened_by),'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id)
Where (coalesce(LKP.row_key,CASE WHEN SRC.opened_by IS NULl THEN 0 ELSE -1 END)<>TRGT.opened_by_key)
)temp;