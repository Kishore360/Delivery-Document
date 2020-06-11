SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.work_item_epic_key' ELSE 'SUCCESS' END as Message
 
 /*SELECT TRGT.row_id, TRGT.row_key, epic.epic_id,
 coalesce(LKP.row_key,case when epic.epic_id is null then 0 else -1 end ) sr, coalesce(TRGT.work_item_epic_key,'') tg*/
 from #STG_TABLE_SCHEMA.workitem_temp_azure SRC
 
 left join (
 select lnk.sourceKey as epic_id, lnk.sourceinstance, lnk.targetKey
 from #STG_TABLE_SCHEMA.work_item_link_base lnk
 left join #MDS_TABLE_SCHEMA.azure_workitem_relation_type_final lnk_typ
 on lnk.linkType = lnk_typ.oppositeEndReferenceName and lnk.sourceinstance = lnk_typ.sourceinstance
 left join #STG_TABLE_SCHEMA.workitem_temp_azure base
 on lnk.sourceKey = base.__numerify__primary_key and base.sourceinstance=lnk.sourceinstance
 left join #DWH_TABLE_SCHEMA.d_lov_map type
 on type.src_rowid=coalesce(concat('TYPE~WORK_ITEM~',base.workItemType),'UNSPECIFIED') and type.source_id=base.sourceinstance
 where lnk.isActive = 1 and lnk_typ.name = 'Parent' and type.dimension_wh_code = 'EPIC') epic 
 on epic.targetKey = SRC.__numerify__primary_key and epic.sourceinstance=SRC.sourceinstance
 
 left join #DWH_TABLE_SCHEMA.d_work_item_epic LKP
 on epic.epic_id=LKP.row_id
 and epic.sourceinstance=LKP.source_id
 
 left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where coalesce(LKP.row_key,case when epic.epic_id is null then 0 else -1 end )<>coalesce(TRGT.work_item_epic_key,'')