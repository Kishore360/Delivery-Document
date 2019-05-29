SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_configuration_item_aggregator_c.location_key' 
ELSE 'MDS to DWH data validation passed for d_configuration_item_aggregator_c.location_key' END as Message from 
(select count(1) as cnt 
FROM gilead_mdsdb.cmdb_ci_final SRC 
JOIN gilead_mdwdb.d_configuration_item_aggregator_c TRGT 
ON SRC.sys_id = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id 
join gilead_mdwdb.d_location LKP
on  COALESCE(SRC.location,'UNSPECIFIED')=LKP.row_id
where coalesce(LKP.row_key,case when SRC.location is null then 0 else -1 end ) <> TRGT.location_key
and TRGT.current_flag='Y') ma