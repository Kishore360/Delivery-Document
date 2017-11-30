SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for f_macm_c_request_item_key' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT 
FROM mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final SRC  
LEFT JOIN mcdonalds_mdwdb.f_macm_c TRGT 
ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN mcdonalds_mdwdb.d_request_item LKP 
ON SRC.instance=LKP.row_id and SRC.sourceinstance=LKP.source_id and SRC.target_table = 'sc_req_item'
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_ritm IS NULL THEN 0 else -1 end)<>TRGT.request_item_key
)a;


