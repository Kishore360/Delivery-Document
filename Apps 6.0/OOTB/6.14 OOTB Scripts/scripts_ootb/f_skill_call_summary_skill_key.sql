
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary.skill_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.dsplit_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_skill_call_summary TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_skill LKP 
	ON ( COALESCE(CONCAT(acd,'~',SRC.split),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.split IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.skill_key ,'')
