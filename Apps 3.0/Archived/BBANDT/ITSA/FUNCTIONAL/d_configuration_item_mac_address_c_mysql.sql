
 
   

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_configuration_item.cpu_core_count_c' ELSE 'SUCCESS' END as Message 
FROM bbandt_mdwdb.d_configuration_item trgt
RIGHT JOIN bbandt_mdsdb.cmdb_ci_final src
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE coalesce(trgt.mac_address_c,'UNSPECIFIED') <> coalesce(src.mac_address,'UNSPECIFIED')