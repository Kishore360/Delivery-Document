SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for f_macm_c_macm_calendar_duration_' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT 
from (select * FROM mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final where cdctype<>'D') SRC
JOIN mcdonalds_mdwdb.f_macm_c TRGT 
ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id) 
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and COALESCE (TIMESTAMPDIFF(SECOND,opened_at,u_migration_comp_date),0)<>TRGT.macm_calendar_duration
)a;
