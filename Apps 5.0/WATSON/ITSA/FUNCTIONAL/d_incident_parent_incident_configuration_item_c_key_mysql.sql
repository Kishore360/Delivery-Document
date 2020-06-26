select CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_incident.configuration_item_c_key' ELSE 'SUCCESS' END as Message  
from watson_mdsdb.incident_final src 
left join watson_mdwdb.d_incident trg on trg.row_id=src.sys_id
left join watson_mdwdb.d_configuration_item  lkp on trg.configuration_item_c_key=lkp.row_key
WHERE COALESCE(lkp.row_key,CASE WHEN src.cmdb_ci IS NULL THEN 0 else '-1' end)<> COALESCE(trg.configuration_item_key,'');

