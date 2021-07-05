SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for f_macm_c_macm_calendar_duration_' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT 
FROM mcd_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final SRC
JOIN mcd_mdwdb.f_macm_c TRGT 
ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id) 
WHERE COALESCE (TIMESTAMPDIFF(SECOND,opened_at,u_migration_comp_date),0)<>TRGT.macm_calendar_duration
)a;
