SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for d_macm_c_review_completed_date' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT
FROM mcd_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final  SRC
JOIN mcd_mdwdb.d_macm_c TRGT 
ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id) 
WHERE CONVERT_TZ(SRC.u_review_completed_date,'GMT','US/Central')<>TRGT.review_completed_date
)a;


