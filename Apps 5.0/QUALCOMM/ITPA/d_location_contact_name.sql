
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_location.contact_name' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.us_d_location_final SRC_P
LEFT JOIN #MDS_TABLE_SCHEMA._final SRC
ON () 
LEFT JOIN #DWH_TABLE_SCHEMA.d_location TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE TRGT.contact_name IS NOT NULL
