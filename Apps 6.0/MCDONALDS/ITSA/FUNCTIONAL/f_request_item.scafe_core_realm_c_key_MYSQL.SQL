SELECT 
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT  THEN 'MDS to DWH data validation failed for f_request_item.scafe_core_realm_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT COUNT(1) as CNT 
FROM mcd_mdsdb.sc_req_item_final a 
JOIN mcd_mdwdb.f_request_item b ON (a.sys_id=b.row_id AND a.sourceinstance=b.source_id)
JOIN mcd_mdwdb.d_scafe_core_realm_c LKP ON (a.x_scafe_core_realm=LKP.row_id AND a.sourceinstance=LKP.source_id)
WHERE LKP.row_key <> b.scafe_core_realm_c_key
)temp;


