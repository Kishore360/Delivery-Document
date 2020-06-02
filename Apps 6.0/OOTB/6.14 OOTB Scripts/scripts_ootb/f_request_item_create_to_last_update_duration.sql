
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.create_to_last_update_duration' ELSE 'SUCCESS' END as Message
-- select COALESCE( TIMESTAMPDIFF(SECOND,SRC.sys_created_on,SRC.sys_updated_on),'') 
 -- , coalesce(TRGT.create_to_last_update_duration,'')
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_req_item_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.f_request_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 where COALESCE( TIMESTAMPDIFF(SECOND,SRC.sys_created_on,SRC.sys_updated_on),'') 
 <> coalesce(TRGT.create_to_last_update_duration,'')