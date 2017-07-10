select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_request_item.touched_by_virteva_c_flag' ELSE 'SUCCESS' END as Message
from
(select count(1) cnt from
wow_mdwdb.d_request_item trg
join (select documentkey,sourceinstance from wow_mdsdb.sys_audit_final 
 where fieldname='assignment_group' and tablename='sc_req_item' and
  (newvalue = 'af54b3910f5f710066e76ab8b1050ebb'
  or oldvalue = 'af54b3910f5f710066e76ab8b1050ebb')
  union 
 select sys_id as documentkey, sourceinstance 
 from wow_mdsdb.sc_req_item_final where assignment_group='af54b3910f5f710066e76ab8b1050ebb'
) temp
  on trg.row_id=temp.documentkey and trg.source_id=temp.sourceinstance and trg.soft_deleted_flag='N'
where trg.touched_by_virteva_c_flag <> 'Y')a