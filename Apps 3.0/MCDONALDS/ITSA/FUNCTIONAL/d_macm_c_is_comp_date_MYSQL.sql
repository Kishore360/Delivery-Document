
SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for d_macm_c_is_comp_date_MYSQL.sql' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT
FROM mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final SRC 
JOIN mcdonalds_mdwdb.d_macm_c TRGT
ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id) 
WHERE 
COALESCE(CONVERT_TZ(SRC.u_is_comp_date,'GMT','US/Central'),'UNSPECIFIED')<>TRGT.is_comp_date
)a;