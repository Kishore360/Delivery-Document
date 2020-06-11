-- changed to 0 as per ITSM - 4001

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_item.hr_category_src_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_req_item_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_request_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 
 LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.sc_request_final WHERE CDCTYPE<>'D') REQ 
 ON (SRC.request  =REQ.sys_id  
 AND SRC.sourceinstance = REQ.sourceinstance  )
 LEFT JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.hr_change_final WHERE CDCTYPE<>'D') HR 
 ON (REQ.parent  =HR.sys_id  
 AND REQ.sourceinstance = HR.sourceinstance  )
 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON ( concat('CATEGORY~HR_CHANGE~', upper(HR.category)) = LKP.src_rowid 
AND HR.sourceinstance = LKP.source_id )
 -- WHERE COALESCE(LKP.row_key,CASE WHEN REQ.parent  IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.hr_category_src_key ,'')
WHERE 0 <> COALESCE(TRGT.hr_category_src_key ,'')
