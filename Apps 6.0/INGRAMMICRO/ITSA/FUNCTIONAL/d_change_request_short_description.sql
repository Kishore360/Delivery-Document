SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.short_description' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT count(1) as CNT
FROM ingrammicro_mdsdb.u_change_request_v2_final SRC 
LEFT JOIN ingrammicro_mdwdb.d_change_request TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE substring(coalesce(SRC.short_description,'UNSPECIFIED'),1,300)<>TRGT.short_description
AND SRC.cdctype='X' ) temp; 
