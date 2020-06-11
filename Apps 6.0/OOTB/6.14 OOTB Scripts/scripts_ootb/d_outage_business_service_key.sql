
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_outage.business_service_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_outage_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_outage TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_service LKP 
 ON ( concat('BUSINESS_SERVICE~',cmdb_ci) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE case when SRC.cmdb_ci IS NULL THEN 0
 when SRC.cmdb_ci IS not NULL and SRC.begin between LKP.effective_from and LKP.effective_to 
 then LKP.row_key else -1 end<> COALESCE(TRGT.business_service_key ,'')