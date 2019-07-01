SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_incident.reported_by_department_c' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from (select sys_id, sourceinstance,cdctime,caller_id from  mcdonalds_mdsdb.incident_final) src 
left join mcdonalds_mdsdb.sys_user_final src1 on src.caller_id=src1.sys_id and src.sourceinstance=src1.sourceinstance
left join mcdonalds_mdsdb.u_gbl_final src2 on src1.u_gbl=src2.sys_id and src1.sourceinstance=src2.sourceinstance
left join mcdonalds_mdwdb.d_incident trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and trgt.soft_deleted_flag='N' and  COALESCE(src2.u_department,'UNSPECIFIED') <> trgt.reported_by_department_c) temp;