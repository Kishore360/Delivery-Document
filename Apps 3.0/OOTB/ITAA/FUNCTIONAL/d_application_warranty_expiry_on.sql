
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.warranty_expiry_on' ELSE 'SUCCESS' END as Message
  FROM #MDS_TABLE_SCHEMA.cmdb_ci_appl_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_application TRGT 
 ON (convert(concat('APPLICATION~', SRC.sys_id) using utf8) =convert(TRGT.row_id using utf8) 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE CONVERT(SRC.warranty_expiration using utf8)<> CONVERT(TRGT.warranty_expiry_on using utf8)
