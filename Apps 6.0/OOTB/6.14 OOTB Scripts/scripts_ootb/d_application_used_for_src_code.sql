 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_application.used_for_src_code' ELSE 'SUCCESS' END as Message
 
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_appl_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_application TRGT 
 ON (concat('APPLICATION~',SRC.sys_id)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE( SRC.used_for ,'')<> COALESCE(TRGT. used_for_src_code ,'');
