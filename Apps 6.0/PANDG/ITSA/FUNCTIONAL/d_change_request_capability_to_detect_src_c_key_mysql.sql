SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_request.capability_to_detect_src_c_key' ELSE 'SUCCESS' END as Message
FROM 
(SELECT Count(1) as CNT 
FROM pandg_mdsdb.change_request_final SRC
LEFT JOIN pandg_mdwdb.d_change_request TRGT ON (SRC.sys_id =TRGT.row_id  AND SRC.sourceinstance= TRGT.source_id)
JOIN pandg_mdwdb.d_lov LKP ON  (concat('CAPABILITY_TO_DETECT_C~CHANGE_REQUEST~~~',upper(u_pg_capability_to_detect))= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id 
AND LKP.dimension_class like '%CAPABILITY_TO_DETECT_C~CHANGE_REQUEST%') 
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_pg_capability_to_detect IS NULL THEN 0 else -1 end)<> (TRGT.capability_to_detect_src_c_key)
) temp;

 
 