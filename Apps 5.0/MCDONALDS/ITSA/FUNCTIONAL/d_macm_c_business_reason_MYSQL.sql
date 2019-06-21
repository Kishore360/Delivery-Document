SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for d_macm_c_business_reason' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT
FROM mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request SRC
JOIN mcdonalds_mdwdb.d_macm_c TRGT
ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(SRC.u_business_reason,'UNSPECIFIED')<>TRGT.business_reason
)a; 