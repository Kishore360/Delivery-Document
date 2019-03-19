SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_macm_c.is_approver_key' ELSE 'SUCCESS' END as Message
FROM (select count(1) as cnt 
from(select sys_id, sourceinstance,u_is_approver,cdctime from mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final) src 
left join mcdonalds_mdsdb.sys_user_final src1 on src.u_is_approver=src1.sys_id and src.sourceinstance=src1.sourceinstance
 LEFT JOIN mcdonalds_mdwdb.d_internal_contact LKP ON 
COALESCE(Concat('INTERNAL_CONTACT~', coalesce(src1.sys_id,src.u_is_approver)), 'UNSPECIFIED')= LKP.row_id 
Left join mcdonalds_mdwdb.f_macm_c  trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) 
 and coalesce(LKP.row_key, case when coalesce(src1.sys_id,src.u_is_approver) is null then 0 else -1 end)  <> trgt.is_approver_key) temp;