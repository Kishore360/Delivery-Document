select CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_incident.configuration_item_c_key' ELSE 'SUCCESS' END as Message  
from fidelity_mdsdb.incident_final src 
join fidelity_mdwdb.d_incident trg 
on trg.row_id=src.sys_id and src.sourceinstance=trg.source_id
left join fidelity_mdwdb.d_configuration_item  lkp 
on coalesce(src.cmdb_ci,'unspecified')=lkp.row_id and src.sourceinstance=lkp.source_id
where coalesce(lkp.row_key, case when src.cmdb_ci is null then 0 else -1 end) <>trg.configuration_item_c_key and src.cdctype<>'D';


