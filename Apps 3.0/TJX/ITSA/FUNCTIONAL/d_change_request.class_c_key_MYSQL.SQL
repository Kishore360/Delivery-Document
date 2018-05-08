SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for d_change_request.class_c_key' ELSE 'SUCCESS' END as Message 
FROM (
SELECT Count(1) as CNT 
FROM tjx_mdsdb.change_request_final src
JOIN tjx_mdwdb.d_change_request trgt ON ( src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id)
JOIN tjx_mdwdb.d_lov LKP ON  (COALESCE(CONCAT('CLASS_C~CHANGE_REQUEST~~~',src.u_class),'UNSPECIFIED')=LKP.row_id AND src.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN src.u_class IS NULL THEN 0 ELSE -1 END)<> (trgt.class_c_key)
)temp;


