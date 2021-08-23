SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_hpd_associations_c.request_type01_c' ELSE 'SUCCESS' END as Message 
FROM 
(
Select Count(1) as CNT 
FROM etrade_mdsdb.hlx_hpd_associations_final SRC 
LEFT JOIN etrade_mdwdb.d_hpd_associations_c TRGT ON SRC.Associations_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(SRC.Request_Type01,'UNSPECIFIED')<>TRGT.request_type01_c
AND SRC.cdctype='X'
) temp; 

 
 