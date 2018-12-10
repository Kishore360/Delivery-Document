



SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_request_item.ritm_sub_category_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
FROM pandg_mdsdb.sc_req_item_final SRC 
LEFT JOIN pandg_mdwdb.d_request_item TRGT ON (SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id)
JOIN pandg_mdwdb.d_lov LKP ON CONCAT('SUB_CATEGORY_RITM_C~SC_REQ_ITEM~~~',SRC.u_sub_category_ritm)=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_sub_category_ritm IS NULL THEN 0 ELSE -1 END)<>TRGT.ritm_sub_category_c_key
) temp;






