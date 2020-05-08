


SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed for d_request_item.ritm_delivery_on_time_c_flag' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.sc_req_item_final SRC 
LEFT JOIN png_mdwdb.d_request_item TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE 
(CASE 
WHEN TRGT.active_flag='N' AND TRGT.estimated_delivery IS NOT NULL AND TRGT.closed_on <= TRGT.estimated_delivery THEN 'Y'  
WHEN TRGT.active_flag='N' AND TRGT.estimated_delivery IS NOT NULL AND TRGT.closed_on > TRGT.estimated_delivery THEN 'N' 
WHEN TRGT.active_flag='Y' OR TRGT.estimated_delivery IS NULL THEN 'X' ELSE NULL END)<>TRGT.ritm_delivery_on_time_c_flag
) temp;



