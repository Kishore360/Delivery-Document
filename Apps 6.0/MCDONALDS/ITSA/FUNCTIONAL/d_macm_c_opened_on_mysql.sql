


SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for d_macm_c_is_migrated_flag' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT from
(select * FROM mcd_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final where cdctype<>'D') SRC
JOIN mcd_mdwdb.d_macm_c TRGT 
ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance=TRGT.source_id) 
-- left join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where  convert_tz(opened_at,'GMT','US/Central')<>TRGT.opened_on
)a;




