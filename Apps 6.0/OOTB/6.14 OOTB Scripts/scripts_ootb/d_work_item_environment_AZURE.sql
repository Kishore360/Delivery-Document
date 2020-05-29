SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.environment' ELSE 'SUCCESS' END as Message
 FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT 
 ON (concat(SRC.__numerify__primary_key, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 WHERE COALESCE(NULL,'' )<> COALESCE(TRGT.environment ,'')
