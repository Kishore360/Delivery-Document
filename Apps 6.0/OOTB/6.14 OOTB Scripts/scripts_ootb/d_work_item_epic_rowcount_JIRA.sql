 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_work_item_epic' ELSE 'SUCCESS' END as Message
 from (
 select *
 from
 (select count(*) count_src  from (select LKP_SRC.*, SRC.boardid from #MDS_TABLE_SCHEMA.issue_final LKP_SRC
left join #DWH_TABLE_SCHEMA.d_lov_map LKP
 on concat('TYPE~WORK_ITEM','~',upper(LKP_SRC.issuetype_id))=LKP.src_rowid
 and LKP_SRC.sourceinstance=LKP.source_id
left join #MDS_TABLE_SCHEMA.epic_final SRC
 on concat(LKP_SRC.key, '') = SRC.key
 and LKP_SRC.sourceinstance = SRC.sourceinstance
where LKP.dimension_wh_code = 'EPIC') SRC ) count_src,
 
 (select count(*) count_trgt from #DWH_TABLE_SCHEMA.d_work_item_epic TRGT 
 join (select distinct source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'Jira_Tenant') ODF on ODF.source_id = TRGT.source_id
 where TRGT.row_key not in (0, -1) and TRGT.row_id is not null and TRGT.soft_deleted_flag = 'N') count_trgt
  where count_src.count_src <>count_trgt.count_trgt
 )SQ