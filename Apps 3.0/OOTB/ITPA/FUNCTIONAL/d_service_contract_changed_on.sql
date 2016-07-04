
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service_contract.changed_on' ELSE 'SUCCESS' END as Message
  FROM <<tenant>>_mdsdb.ast_contract_final SRC 
LEFT JOIN <<tenant>>_mdwdb.d_service_contract TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
JOIN  app_test.lsm_ls_source_timezone L 
	ON (SRC.sourceinstance = L.sourceid)
WHERE convert_tz(SRC.sys_updated_on,source_time_zone,target_time_zone)<> TRGT.changed_on 
