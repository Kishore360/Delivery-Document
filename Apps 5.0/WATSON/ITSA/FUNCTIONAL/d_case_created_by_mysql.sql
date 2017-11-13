
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_case.created_by' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.sn_customerservice_case_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE TRGT.row_key not in (0, -1) and 
COALESCE(SRC.sys_created_by,'')<> COALESCE(TRGT.created_by,'')
