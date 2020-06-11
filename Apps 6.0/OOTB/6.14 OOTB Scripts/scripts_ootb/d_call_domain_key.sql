
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_call.domain_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.new_call_final WHERE CDCTYPE<>'D') SRC

 LEFT JOIN #DWH_TABLE_SCHEMA.d_call TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
LEFT JOIN #DWH_TABLE_SCHEMA.d_domain LKP 
 ON ( SRC.sys_domain = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key, case when SRC.sys_domain is null then '0' else '-1' end )<> COALESCE(TRGT.domain_key,'')
