selECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_incident.reported_by_department_c' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from (select sys_id, sourceinstance,cdctime,caller_id from  mcdonalds_mdsdb.incident_final) src 
 join (select sys_id,sourceinstance,u_gbl from mcdonalds_mdsdb.sys_user_final )src1 on src.caller_id=src1.sys_id and src.sourceinstance=src1.sourceinstance
 join (select sys_id,sourceinstance,COALESCE(u_department,'UNSPECIFIED')reported_by_department_c from mcdonalds_mdsdb.u_gbl_final) src2 on src1.u_gbl=src2.sys_id and src1.sourceinstance=src2.sourceinstance
 join (select row_id,source_id,reported_by_department_c from mcdonalds_mdwdb.d_incident where soft_deleted_flag='N') trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
and (src.cdctime<=f1.lastupdated)  where src2.reported_by_department_c  <> trgt.reported_by_department_c) temp;