
SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for d_macm_c_change_reason_src_key' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT from 
(select * FROM mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final where cdctype<>'D') SRC
JOIN mcdonalds_mdwdb.d_macm_c TRGT 
ON (SRC.SYS_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN mcdonalds_mdwdb.d_lov LKP
ON COALESCE(CONCAT('CHANGE_REASON~MACM','~~~',UPPER(SRC.u_change_reason)),'UNSPECIFIED')=LKP.row_id
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 
on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and COALESCE(LKP.row_key, CASE WHEN SRC.u_change_reason IS NULL THEN 0 ELSE -1 END) <> TRGT.change_reason_src_key
)a;