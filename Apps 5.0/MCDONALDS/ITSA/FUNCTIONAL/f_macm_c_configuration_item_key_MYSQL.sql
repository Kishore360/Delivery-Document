
SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for f_macm_c_configuration_item_key' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT 
FROM mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final  SRC
LEFT JOIN mcdonalds_mdwdb.f_macm_c TRGT 
ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id) 
LEFT JOIN mcdonalds_mdwdb.d_configuration_item LKP
ON (SRC.cmdb_ci)=LKP.row_id AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,case when cmdb_ci is null then 0 else -1 end )<>TRGT.configuration_item_key
)a;
