
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_case.state_src_key' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sn_customerservice_case_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
	ON ( coalesce(concat('STATE~CASE~',SRC.state),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id AND dimension_class ='STATE~CASE')
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.state IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.state_src_key ,'')
