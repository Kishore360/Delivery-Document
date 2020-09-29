select CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_incident.configuration_item_c_key' ELSE 'SUCCESS' END as Message  
from fidelity_mdsdb.incident_final SRC 
join fidelity_mdwdb.d_incident trg on trg.row_id=SRC.sys_id
join fidelity_mdwdb.d_configuration_item  LKP  on
( SRC.cmdb_ci = LKP.row_id  AND SRC.sourceinstance = LKP.source_id )
where SRC.cdctype<>'D' and 
COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci  IS NULL THEN 0 else -1 end)  <> 
trg.configuration_item_c_key;


