
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.business_service_used_for' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC 
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id ) 
 left join #DWH_TABLE_SCHEMA.d_service ci
 on ci.row_id = CONCAT('BUSINESS_SERVICE~',SRC.business_service)
 and SRC.sourceinstance=ci.source_id
 WHERE COALESCE( ci.used_for_src_code ,'UNSPECIFIED')<> COALESCE(TRGT.business_service_used_for ,'')