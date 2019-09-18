SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_incident.legacy_ci_name_c' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from (select sys_id, sourceinstance,cdctime,u_legacy_ci from  mcdonalds_mdsdb.incident_final) src 
left join mcdonalds_mdsdb.u_legacy_configuration_item_final src1 on src.u_legacy_ci=src1.sys_id and src.sourceinstance=src1.sourceinstance
left join mcdonalds_mdwdb.d_incident trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and  src1.u_legacy_ci_name <> trgt.legacy_ci_name_c) temp;