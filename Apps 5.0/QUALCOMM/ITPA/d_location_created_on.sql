
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_location.created_on' ELSE 'SUCCESS' END as Message
  FROM #MDS_TABLE_SCHEMA.us_d_location_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_location TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE SRC.created_on<> TRGT.created_on 
