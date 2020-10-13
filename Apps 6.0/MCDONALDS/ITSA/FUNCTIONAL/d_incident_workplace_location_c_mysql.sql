SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for d_incident.workplace_location_c' ELSE 'SUCCESS' END as Message
from 
(select count(1) as cnt  from (select sys_id, sourceinstance, u_workplace_location, cdctime from mcdonalds_mdsdb.incident_final) src
left join mcdonalds_mdsdb.u_integration_srms_location_final src1 on src1.sys_id=src.u_workplace_location and src.sourceinstance=src1.sourceinstance
left join mcdonalds_mdwdb.d_incident trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = src.sourceinstance)
where (src.cdctime<=f1.lastupdated) and  COALESCE(src1.u_name,'') <> trgt.workplace_location_c) temp;