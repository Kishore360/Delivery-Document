
SELECT
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for f_macm_c_configuration_item_key' ELSE 'SUCCESS' END as Message
FROM
(
SELECT Count(1) as CNT 
FROM mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final  SRC
LEFT JOIN mcdonalds_mdwdb.f_macm_c TRGT 
ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id) 
LEFT JOIN mcdonalds_mdwdb.d_configuration_item LKP
ON (COALESCE(SRC.cmdb_ci, 'UNSPECIFIED')=LKP.row_id and SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 ELSE -1 END)<>TRGT.configuration_item_key
)a;
