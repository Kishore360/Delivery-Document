SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.time_spent_update_count' ELSE 'SUCCESS' END as Message
 
 FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC 

 left join #DWH_TABLE_SCHEMA.d_lov_map DM
 on concat('STATUS~WORK_ITEM~',upper(SRC.`state`))=DM.src_rowid
 
-- left join #DWH_TABLE_SCHEMA.d_lov_map RES
-- on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.ResolutionId))=RES.src_rowid
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT 
 ON (concat(SRC.__numerify__primary_key, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
 
  WHERE COALESCE(null, 0) <>coalesce(TRGT.time_spent_update_count,'')