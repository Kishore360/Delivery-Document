
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_acd.name' ELSE 'SUCCESS' END as Message 
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.peripheral_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_acd TRGT 
	ON (SRC.peripheralid =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE(SRC.enterprisename,'')<> COALESCE(TRGT.name,'')

