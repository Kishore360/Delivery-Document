SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.orphan_flag' ELSE 'SUCCESS' END as Message

/*select SRC.__numerify__primary_key,SRC.sourceinstance, typ.dimension_wh_code,
case when LNK_CHL.sourceKey is null and LNK_PAR.targetKey is null then 'Y' else 'N' end sr,
coalesce(TRGT.orphan_flag,'') tgt*/

FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC

left join #DWH_TABLE_SCHEMA.d_lov_map typ
 on concat('TYPE~WORK_ITEM','~',upper(SRC.workItemType))=typ.src_rowid
 and SRC.sourceinstance=typ.source_id

 left join (
 select lnk.sourceKey, lnk.sourceinstance, lnk.targetKey
 from #STG_TABLE_SCHEMA.work_item_link_base lnk
 left join #MDS_TABLE_SCHEMA.azure_workitem_relation_type_final lnk_typ
 on lnk.linkType = lnk_typ.oppositeEndReferenceName and lnk.sourceinstance = lnk_typ.sourceinstance
 where lnk.isActive = 1
 ) LNK_CHL
 on LNK_CHL.targetKey = SRC.__numerify__primary_key and SRC.sourceinstance=LNK_CHL.sourceinstance
 
  left join (
 select lnk.sourceKey, lnk.sourceinstance, lnk.targetKey
 from #STG_TABLE_SCHEMA.work_item_link_base lnk
 left join #MDS_TABLE_SCHEMA.azure_workitem_relation_type_final lnk_typ
 on lnk.linkType = lnk_typ.oppositeEndReferenceName and lnk.sourceinstance = lnk_typ.sourceinstance
 where lnk.isActive = 1
 ) LNK_PAR
 on LNK_PAR.sourceKey = SRC.__numerify__primary_key and SRC.sourceinstance=LNK_PAR.sourceinstance

LEFT JOIN  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
where TRGT.soft_deleted_flag <> 'Y' and
coalesce(case when LNK_CHL.sourceKey is null and LNK_PAR.targetKey is null then 'Y' else 'N' end, 'N')<>coalesce(TRGT.orphan_flag,'');