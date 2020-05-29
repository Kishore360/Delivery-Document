SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_configuration_item.supported_by_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_final WHERE CDCTYPE<>'D') SRC 
 Left join ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_service_final WHERE CDCTYPE<>'D') SRC3
ON SRC.sys_id=SRC3.sys_id 
AND SRC.sourceinstance=SRC3.sourceinstance 
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
	ON ( CONCAT('INTERNAL_CONTACT~',SRC.supported_by) = LKP.row_id
	AND SRC.sourceinstance = LKP.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_configuration_item TRGT 
 ON (SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.supported_by IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.supported_by_key ,'')