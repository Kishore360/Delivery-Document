SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.proposed_flag' ELSE 'SUCCESS' END as Message
 from #STG_TABLE_SCHEMA.workitem_temp_azure SRC
 
 left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM
on concat('STATUS~WORK_ITEM~',upper(SRC.state))=LM.src_rowid
 
where coalesce(CASE WHEN LM.dimension_wh_code in ('PROPOSED') THEN 'Y' ELSE 'N' END,'N') <> coalesce(TRGT.proposed_flag ,'')