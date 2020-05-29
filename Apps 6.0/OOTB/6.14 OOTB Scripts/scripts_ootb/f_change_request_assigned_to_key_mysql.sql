

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_change_request.assigned_to_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM #MDS_TABLE_SCHEMA.change_request_final SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.f_change_request TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',assigned_to)= LKP.row_id 
 
AND SRC.sourceinstance= LKP.source_id )
AND TRGT.pivot_date between LKP.effective_from and LKP.effective_to
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assigned_to IS NULL THEN 0 else -1 end)<> TRGT.assigned_to_key)temp;
