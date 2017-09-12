SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_work_order.closed_on' ELSE 'SUCCESS' END as Message
FROM schneider_mdsdb.woi_workorder_final  SRC JOIN schneider_mdwdb.f_work_order TRGT ON (SRC.work_order_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id ) inner join (select documentkey,sourceinstance,max(sys_updated_by) as closed_by, max(sys_created_on) as closed_on
from schneider_workdb.woi_workorder_sys_audit where tablename = 'woi_workorder' and fieldname = 'status' and newvalue = 'closed' 
group by documentkey,sourceinstance) sys_audit on TRGT.row_id = sys_audit.documentkey and TRGT.source_id = sys_audit.sourceinstance
 LEFT JOIN schneider_mdwdb.d_calendar_date LKP ON  convert_tz(sys_audit.closed_on,'GMT','America/Los_Angeles') = LKP.row_id WHERE COALESCE(LKP.row_key,CASE WHEN sys_audit.closed_on IS NULL THEN 0 else -1 end)<> (TRGT.closed_on_key) 
