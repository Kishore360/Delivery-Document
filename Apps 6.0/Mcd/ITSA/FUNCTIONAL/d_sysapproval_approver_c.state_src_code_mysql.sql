SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_sysapproval_approver_c.state_src_code' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from (select sys_id, sourceinstance, cdctime, state from  mcd_mdsdb.sysapproval_approver_final) src 
left join  mcd_mdwdb.d_sysapproval_approver_c trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and  src.state <> trgt.state_src_code) temp;