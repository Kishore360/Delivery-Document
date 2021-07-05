
SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for d_macm_c_cross_application_impact' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT 
FROM mcd_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final SRC
JOIN mcd_mdwdb.d_macm_c TRGT 
ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id) 
LEFT JOIN mcd_mdwdb.d_lov LKP
ON COALESCE(CONCAT('CROSS_APPLICATION_IMPACT~MACM','~~~',UPPER(SRC.u_cross_application_impact)),'UNSPECIFIED')=LKP.row_id
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.u_cross_application_impact IS NULL THEN 0 ELSE -1 END) <> TRGT.cross_application_impact_src_key
)a;

