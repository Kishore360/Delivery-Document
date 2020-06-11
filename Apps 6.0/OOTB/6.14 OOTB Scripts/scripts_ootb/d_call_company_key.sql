SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_call.company_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.new_call_final WHERE CDCTYPE<>'D') SRC 
 
 LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_user_final WHERE CDCTYPE<>'D') SRC2
ON (SRC.caller = SRC2.sys_id
AND  SRC.sourceinstance= SRC2.sourceinstance)

 LEFT JOIN #DWH_TABLE_SCHEMA.d_call TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_organization LKP 
 ON ( CONCAT('SUBSIDIARY~',SRC2.company) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )

 WHERE COALESCE(LKP.row_key,CASE WHEN SRC2.company IS NULL THEN '0' else '-1' end)<> COALESCE(TRGT.company_key,'')

