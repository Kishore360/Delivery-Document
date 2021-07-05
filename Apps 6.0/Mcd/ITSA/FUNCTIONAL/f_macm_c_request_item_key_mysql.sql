SELECT
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for f_macm_c_request_item_key' ELSE 'SUCCESS' END as Message
FROM
(
SELECT Count(1) as CNT 
FROM mcd_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final SRC 
JOIN mcd_mdwdb.f_macm_c TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN mcd_mdwdb.d_request_item LKP ON (COALESCE(SRC.u_ritm,'UNSPECIFIED')=LKP.row_id AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.u_ritm IS NULL THEN 0 ELSE -1 END)<> TRGT.request_item_key
)a;


