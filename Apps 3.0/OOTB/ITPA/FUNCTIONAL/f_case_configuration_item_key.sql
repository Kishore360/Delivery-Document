
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.configuration_item_key' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.sn_customerservice_case_final SRC 
LEFT JOIN <<tenant>>_mdwdb.f_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN <<tenant>>_mdwdb.d_configuration_item LKP 
	ON ( COALESCE(SRC.cmdb_ci,'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.configuration_item_key ,'')
