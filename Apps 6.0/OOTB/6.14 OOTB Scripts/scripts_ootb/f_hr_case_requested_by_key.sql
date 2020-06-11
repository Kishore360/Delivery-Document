
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_hr_case.requested_by_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hr_case_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_hr_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
	ON ( CONCAT('INTERNAL_CONTACT~',CALLER) = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.caller IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.requested_by_key ,'')
