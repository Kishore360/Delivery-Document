SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_change_request.vendor_c_key' ELSE 'SUCCESS' END as Message 
FROM wpl_mdsdb.change_request_final SRC 
JOIN wpl_mdwdb.f_change_request TRGT 
ON (SRC.sys_id = TRGT.row_id AND SRC.sourceinstance = TRGT.source_id )
join wpl_mdwdb.d_configuration_item ref  
on SRC.cmdb_ci =ref.Row_id AND ref.source_id= SRC.sourceinstance
 WHERE coalesce(ref.row_key,case when SRC.cmdb_ci is null then 0 else -1 end)<> (TRGT.configuration_item_key) 
 and SRC.cdctype='X'
