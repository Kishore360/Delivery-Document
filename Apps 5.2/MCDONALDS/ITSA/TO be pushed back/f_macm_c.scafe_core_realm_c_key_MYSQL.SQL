SELECT 
CASE WHEN CNT  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT  THEN 'MDS to DWH data validation failed for f_macm_c.scafe_core_realm_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT COUNT(1) as CNT 
from (select * FROM mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final where cdctype<>'D') a 
JOIN mcdonalds_mdwdb.f_macm_c b ON (a.sys_id=b.row_id AND a.sourceinstance=b.source_id)
JOIN mcdonalds_mdwdb.d_scafe_core_realm_c LKP ON (a.x_scafe_core_realm=LKP.row_id AND a.sourceinstance=LKP.source_id)
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
where (SRC.cdctime<=f1.lastupdated) and LKP.row_key <> b.scafe_core_realm_c_key
)temp;


