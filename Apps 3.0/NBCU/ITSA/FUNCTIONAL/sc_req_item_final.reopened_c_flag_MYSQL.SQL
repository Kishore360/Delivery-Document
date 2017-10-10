
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for sc_req_item_final.reopened_c_flag' ELSE 'SUCCESS' END as  Message
FROM 
(
SELECT count(1) as CNT  
FROM nbcu_mdsdb.sc_req_item_final src 
LEFT JOIN nbcu_mdwdb.d_task trgt ON src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
WHERE (CASE WHEN src.u_reopen_count>0 THEN 'Y' ELSE 'N' END) <> (trgt.reopened_c_flag)
)temp;


