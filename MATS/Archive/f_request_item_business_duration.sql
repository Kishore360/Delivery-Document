

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.business_duration' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.sc_req_item_final SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request_item TRGT 
 ON (convert(SRC.sys_id using utf8) =convert(TRGT.row_id using utf8) 
 AND convert(SRC.sourceinstance using utf8)= convert(TRGT.source_id using utf8) )
WHERE CONVERT( TIMESTAMPDIFF(second,'1970-01-01 00:00:00',SRC.business_duration) using utf8)<> CONVERT( COALESCE(TRGT.business_duration,'') using utf8)
