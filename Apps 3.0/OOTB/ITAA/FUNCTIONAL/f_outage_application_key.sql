
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_outage.application_key' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.cmdb_ci_outage_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_outage TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_application LKP 
 ON ( CONVERT(concat('APPLICATION~',cmdb_ci) using utf8)= convert(LKP.row_id using utf8)
AND CONVERT(SRC.sourceinstance using utf8)= convert(LKP.source_id using utf8))
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 else '-1' end)<> COALESCE(CONVERT(TRGT.application_key using utf8),'')
