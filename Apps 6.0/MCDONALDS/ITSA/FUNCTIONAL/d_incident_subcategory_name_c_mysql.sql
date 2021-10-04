SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_incident.subcategory_name_c' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from (select sys_id, sourceinstance,cdctime,u_subcategory from  mcd_mdsdb.incident_final) src 
left join mcd_mdsdb.u_subcategory_final src1 on src.u_subcategory=src1.sys_id and src.sourceinstance=src1.sourceinstance
left join mcd_mdwdb.d_incident trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcd_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and  COALESCE(src1.u_subcategory,'') <> trgt.subcategory_name_c) temp;