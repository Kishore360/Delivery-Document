select SRC.sys_id,
timestampdiff(second,'1970-01-01 00:00:00',SRC.business_duration) as src , coalesce(TRGT.business_duration ,'')

FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_req_item_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE timestampdiff(second,'1970-01-01 00:00:00',SRC.business_duration) <> coalesce(TRGT.business_duration ,'')