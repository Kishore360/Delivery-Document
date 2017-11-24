SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for d_change_request.class_update_direction_c' ELSE 'SUCCESS' END as Message 
FROM (
SELECT Count(1) as CNT 
FROM tjx_mdsdb.change_request_final src
JOIN tjx_mdwdb.d_change_request trgt on (src.sys_id = trgt.row_id AND src.sourceinstance = trgt.source_id)
JOIN tjx_mdwdb.d_lov LKP1 
ON (COALESCE(CONCAT('CLASS_C~CHANGE_REQUEST~~~',src.u_class),'UNSPECIFIED')=LKP1.row_id AND src.sourceinstance=LKP1.source_id)
JOIN tjx_mdwdb.d_lov LKP2 
ON (COALESCE(CONCAT('CLASS_OVERRIDE_C~CHANGE_REQUEST~~~',src.u_class_override),'UNSPECIFIED')=LKP2.row_id AND src.sourceinstance=LKP2.source_id)
WHERE 
(CASE WHEN LKP1.dimension_name='Minor' AND LKP2.dimension_name='Significant' THEN 'Escalated'
WHEN LKP1.dimension_name='Significant' AND LKP2.dimension_name='Minor' THEN 'Downgraded'
ELSE 'No Change' END)<> (trgt.class_update_direction_c)
)temp;



