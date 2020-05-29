 SELECT 
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_request_item.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT  count(1) as CNT 
 FROM #MDS_TABLE_SCHEMA.sc_req_item_final SRC
 JOIN #DWH_TABLE_SCHEMA.f_request_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
	JOIN #DWH_TABLE_SCHEMA.d_lov_map dlm 
ON TRGT.state_src_key = dlm.src_key AND dlm.dimension_wh_code = 'CLOSED'
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',closed_by)= LKP.row_id 
 AND SRC.sourceinstance= LKP.source_id
AND TRGT.pivot_date
 BETWEEN LKP.effective_from AND LKP.effective_to)
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact ic ON (SRC.sys_updated_by = ic.user_name AND SRC.sourceinstance = ic.source_id)
 WHERE 
 COALESCE(LKP.row_key,ic.row_key,CASE WHEN SRC.closed_by IS NULL THEN 0 else -1 end)<> (TRGT.closed_by_key)) temp;
 
 
