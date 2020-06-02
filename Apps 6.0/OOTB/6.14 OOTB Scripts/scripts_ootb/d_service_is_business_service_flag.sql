SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_service.is_business_service_flag' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.cmdb_ci_service_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_service TRGT 
 ON (concat('BUSINESS_SERVICE~',SRC.sys_id)  =TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE 'Y'<> COALESCE(TRGT.is_business_service_flag ,'')

