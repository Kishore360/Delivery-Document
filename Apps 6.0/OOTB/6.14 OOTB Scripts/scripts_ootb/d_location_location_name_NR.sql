SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_location.location_name' ELSE 'SUCCESS' END as Message
FROM  #MDS_TABLE_SCHEMA.PageView_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_location TRGT 
	ON( CONCAT(coalesce(SRC.city,'') ,'~', coalesce(SRC.regionCode,''), '~', coalesce(SRC.countryCode,'')) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE COALESCE( CONCAT(coalesce(SRC.city,''), ', ', coalesce(SRC.regionCode,''), ', ', coalesce(SRC.countryCode,'')),'')<> COALESCE(TRGT.location_name,'')