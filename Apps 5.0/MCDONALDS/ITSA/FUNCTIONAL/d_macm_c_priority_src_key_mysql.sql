
SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for d_macm_c_component_src_key' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT 
FROM mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final SRC
JOIN mcdonalds_mdwdb.d_macm_c TRGT 
ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id) 
LEFT JOIN mcdonalds_mdwdb.d_lov LKP
COALESCE(CONCAT('PRIORITY', '~', 'MACM', '~', '~', '~',Upper(macm.priority)), 'UNSPECIFIED')=LKP.row_id
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.priority IS NULL THEN 0 ELSE -1 END) <> TRGT.priority_src_key
)a;







