
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_configuration_item_aggregator_c.name' 
ELSE 'MDS to DWH data validation passed for d_configuration_item_aggregator_c.name' END as Message from 
(select count(1) cnt 
FROM gilead_mdsdb.cmdb_ci_final SRC 
JOIN gilead_mdwdb.d_configuration_item_aggregator_c TRGT 
ON SRC.sys_id = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id 
 where SRC.name<> TRGT.name and TRGT.current_flag='Y' and SRC.cdctype='X') b
