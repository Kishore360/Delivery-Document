


SELECT
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT THEN 'MDS to DWH data validation failed for d_macm_c_is_migrated_flag' ELSE 'SUCCESS' END as Message
FROM
(
SELECT count(1) as CNT from
(select * FROM mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final where cdctype<>'D') SRC
JOIN mcdonalds_mdwdb.d_macm_c TRGT 
ON (SRC.sys_id =TRGT.row_id AND SRC.sourceinstance=TRGT.source_id) 
-- left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where  CASE WHEN u_migration_comp_date is not null THEN 'Y' ELSE 'N' END<>TRGT.is_migrated_flag
)a;



