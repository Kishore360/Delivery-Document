SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_sysapproval_approver_c.change_request_key' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from (select sys_id, sourceinstance, cdctime, document_id,cdctype from  mcdonalds_mdsdb.sysapproval_approver_final where cdctype='X') src 
 join  mcdonalds_mdwdb.d_sysapproval_approver_c trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 join mcdonalds_mdwdb.d_change_request LKP on src.document_id=LKP.row_id
 join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 
on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) 

and  coalesce(LKP.row_key, case when src.document_id is null then 0 else -1 end) <> trgt.change_request_key) temp;