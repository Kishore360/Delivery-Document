SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_macm_c.macm_c_key' ELSE 'SUCCESS' END as Message
FROM (select count(1) as cnt 
from(select sys_id, sourceinstance,cdctime from mcd_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final) src 
 LEFT JOIN mcd_mdwdb.d_macm_c LKP ON src.sys_id= LKP.row_id 
Left join mcd_mdwdb.f_macm_c  trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) 
 and coalesce(LKP.row_key, case when src.sys_id is null then 0 else -1 end)  <> trgt.macm_c_key) temp;