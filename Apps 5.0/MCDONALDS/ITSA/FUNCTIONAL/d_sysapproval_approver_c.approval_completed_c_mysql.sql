SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_sysapproval_approver_c.approval_completed_c' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from (select sys_id, sourceinstance, cdctime, u_approval_completed from  mcdonalds_mdsdb.sysapproval_approver_final) src 
left join  mcdonalds_mdwdb.d_sysapproval_approver_c trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and  
CONVERT_TZ(src.u_approval_completed,'GMT','US/Central') <> trgt.approval_completed_c) temp;