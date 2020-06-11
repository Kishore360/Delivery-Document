SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.created_by_key' ELSE 'SUCCESS' END as Message
 FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT 
 ON (concat(SRC.__numerify__primary_key, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON coalesce(CONCAT('INTERNAL_CONTACT~',SRC.createdByKey),'UNSPECIFIED') = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id 
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.createdByKey is null then 0 else -1 end)<> 
 COALESCE(TRGT.created_by_key,'');