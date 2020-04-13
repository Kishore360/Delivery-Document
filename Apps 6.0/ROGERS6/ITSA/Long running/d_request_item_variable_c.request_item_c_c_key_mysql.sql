SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_request_item_variable_c.request_item_c_key' ELSE 'SUCCESS' END as Message FROM (
Select count(1) as CNT
FROM rogers6_mdsdb.sc_item_option_mtom_final SRC 
JOIN rogers6_mdwdb.d_request_item_variable_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN rogers6_mdwdb.d_request_item LKP ON LKP.row_id=
COALESCE(SRC.request_item,'UNSPECIFIED')
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.request_item is NULL THEN 0 ELSE -1 END)<>TRGT.request_item_c_key) temp;
