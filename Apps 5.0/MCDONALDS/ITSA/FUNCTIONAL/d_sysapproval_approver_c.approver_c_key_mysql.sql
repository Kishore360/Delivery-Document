SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_sysapproval_approver_c.approver_c_key' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from (select sys_id, sourceinstance, cdctime, approver,cdctype from  mcdonalds_mdsdb.sysapproval_approver_final) src 
left join  mcdonalds_mdwdb.d_sysapproval_approver_c trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join mcdonalds_mdwdb.d_internal_contact LKP on COALESCE(CONCAT('INTERNAL_CONTACT~',src.approver),'UNSPECIFIED')=LKP.row_id
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where src.cdctype='X'
and (src.cdctime<=f1.lastupdated) and  coalesce(LKP.row_key, case when src.approver is null then 0 else -1 end) <> trgt.approver_c_key) temp;