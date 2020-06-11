-- changed to 0 as per ITSM - 4001

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_request_item.hr_change_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_req_item_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_request_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_request_final WHERE CDCTYPE<>'D') REQ 
 ON (SRC.request  =REQ.sys_id  
 AND SRC.sourceinstance = REQ.sourceinstance  )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_hr_change HR 
 ON (REQ.parent  =HR.row_id  
 AND REQ.sourceinstance = HR.source_id  )
 
 WHERE 0 <> COALESCE(TRGT.hr_change_key,'')
