SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_hpd_associations_c.hpd_change_request_c_key' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1) as CNT
FROM etrade_mdsdb.hlx_hpd_associations_final SRC 
LEFT JOIN etrade_mdwdb.d_hpd_associations_c TRGT ON SRC.Associations_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN etrade_mdwdb.d_change_request LKP ON SRC.Request_ID01=LKP.change_request_number
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.Request_ID01 IS NULl THEN 0 ELSE -1 END)<>TRGT.hpd_change_request_c_key
AND SRC.cdctype='X'
) temp; 

 
