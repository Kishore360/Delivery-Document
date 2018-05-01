SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for d_change_request.class_override_reason_c' ELSE 'SUCCESS' END as Message 
FROM (
SELECT Count(1) as CNT 
FROM tjx_mdsdb.change_request_final src
LEFT JOIN tjx_mdwdb.d_change_request trgt on src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id
WHERE COALESCE(src.u_class_override_reason,'UNSPECIFIED')<>trgt.class_override_reason_c
)temp;


