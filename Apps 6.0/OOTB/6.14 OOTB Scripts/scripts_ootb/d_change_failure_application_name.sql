
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_change_failure.application_name' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.change_request_final WHERE CDCTYPE<>'D') SRC 
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_change_failure where year(effective_to)=2999) TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id ) 
 left join #DWH_TABLE_SCHEMA.d_application ci
 on ci.row_id = CONCAT('APPLICATION~',SRC.cmdb_ci)
 and SRC.sourceinstance=ci.source_id
 WHERE COALESCE( ci.name ,'UNSPECIFIED')<> COALESCE(TRGT.application_name ,'')