SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for f_macm_c_opened_on_key' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT 
FROM  mcd_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final SRC
JOIN mcd_mdwdb.f_macm_c TRGT ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN mcd_mdwdb.d_calendar_date LKP 
ON (LKP.row_id=DATE_FORMAT(convert_tz(SRC.opened_at,'GMT','US/Central'),'%Y%m%d')and LKP.source_id=0)
WHERE COALESCE (LKP.row_key,case when SRC.opened_at is null then 0 else -1 end) <> (TRGT.opened_on_key)
)a;
 