SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.work_item_resolution_src_key' ELSE 'SUCCESS' END as Message
 
 from #STG_TABLE_SCHEMA.workitem_temp_azure SRC
 
 -- left join #MDS_TABLE_SCHEMA.resolutions_final STA
 -- on SRC.ResolutionId=STA.id
 
 left join #DWH_TABLE_SCHEMA.d_lov_map LKP
 on coalesce(concat('RESOLUTION~WORK_ITEM','~',(SRC.msvsts_common_resolvedreason)),'UNSPECIFIED')=LKP.src_rowid
 and SRC.sourceinstance=LKP.source_id
 
 left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 
 where coalesce(LKP.src_key, case when SRC.msvsts_common_resolvedreason is null then 0 else -1 end) <>coalesce(TRGT.work_item_resolution_src_key,'');