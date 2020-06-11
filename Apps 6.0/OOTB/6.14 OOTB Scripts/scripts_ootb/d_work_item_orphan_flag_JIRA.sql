SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.orphan_flag' ELSE 'SUCCESS' END as Message

/*select SRC.id,SRC.sourceinstance, typ.dimension_wh_code,
case when isu_lnk.issueid is null then 'Y' else 'N' end sr,
coalesce(TRGT.orphan_flag,'') tgt*/

FROM #MDS_TABLE_SCHEMA.issue_final SRC

left join #DWH_TABLE_SCHEMA.d_lov_map typ
 on concat('TYPE~WORK_ITEM','~',upper(SRC.issuetype_id))=typ.src_rowid
 and SRC.sourceinstance=typ.source_id

left join #MDS_TABLE_SCHEMA.issue_issuelinks_final isu_lnk
on concat(SRC.id, '') = isu_lnk.issueid
and SRC.sourceinstance = isu_lnk.sourceinstance

LEFT JOIN  #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.id, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
where coalesce(case when isu_lnk.issueid is null then 'Y' else 'N' end, 'N')<>coalesce(TRGT.orphan_flag,'');