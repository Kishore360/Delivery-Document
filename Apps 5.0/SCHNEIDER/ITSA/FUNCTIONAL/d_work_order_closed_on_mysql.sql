SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_order.closed_on' ELSE 'SUCCESS' END as Message
FROM schneider_mdsdb.woi_workorder_final  SRC JOIN schneider_mdwdb.d_work_order TRGT ON (SRC.request_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) inner join (select documentkey,sourceinstance,max(sys_updated_by) as closed_by, max(sys_created_on) as closed_on
from schneider_workdb.woi_workorder_sys_audit where tablename = 'woi_workorder' and fieldname = 'status' and newvalue = 'closed' 
group by documentkey,sourceinstance) sys_audit on TRGT.row_id = sys_audit.documentkey and TRGT.source_id = sys_audit.sourceinstance
WHERE from_unixtime(sys_audit.closed_on)<> (TRGT.closed_on) ;