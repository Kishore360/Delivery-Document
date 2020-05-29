SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.work_item_status_src_key' ELSE 'SUCCESS' END as Message
 FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
 ON (concat(SRC.__numerify__primary_key, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map LKP 
 ON ( CONCAT('STATUS','~','WORK_ITEM','~',UPPER(SRC.`state`)) = LKP.src_rowid 
 AND SRC.sourceinstance = LKP.source_id )
 WHERE TRGT.soft_deleted_flag <> 'Y' and COALESCE(LKP.src_key,CASE WHEN SRC.`state` IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.work_item_status_src_key,'')