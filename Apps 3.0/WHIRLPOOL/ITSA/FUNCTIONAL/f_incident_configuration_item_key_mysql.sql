SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.vendor_c_key' ELSE 'SUCCESS' END as Message 
FROM whirlpool_mdsdb.incident_final SRC 
JOIN whirlpool_mdwdb.f_incident TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
join whirlpool_mdwdb.d_configuration_item ref  
on SRC.cmdb_ci =ref.Row_id AND ref.source_id= SRC.sourceinstance
 WHERE coalesce(ref.row_key,case when SRC.cmdb_ci is null then 0 else -1 end)<> (TRGT.configuration_item_key) 