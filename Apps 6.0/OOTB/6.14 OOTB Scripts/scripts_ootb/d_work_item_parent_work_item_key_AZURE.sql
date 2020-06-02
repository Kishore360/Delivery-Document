SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.parent_work_item_key' ELSE 'SUCCESS' END as Message
 
 from #STG_TABLE_SCHEMA.workitem_temp_azure SRC
  
 left join (
 select distinct lnk.sourceKey, lnk.sourceinstance, lnk.targetKey
 from #STG_TABLE_SCHEMA.work_item_link_base lnk
 left join #MDS_TABLE_SCHEMA.azure_workitem_relation_type_final lnk_typ
 on lnk.linkType = lnk_typ.oppositeEndReferenceName and lnk.sourceinstance = lnk_typ.sourceinstance
 where lnk_typ.name = 'Parent' and lnk.isActive = 1) LNK
 on LNK.targetKey = SRC.__numerify__primary_key and SRC.sourceinstance=LNK.sourceinstance

 left join #DWH_TABLE_SCHEMA.d_work_item PAR
 on concat(LNK.sourceKey, '')=PAR.row_id
 and LNK.sourceinstance=PAR.source_id
 
 left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where coalesce(PAR.row_key,case when LNK.sourceKey is null then 0 else -1 end )<>coalesce(TRGT.parent_work_item_key,'')