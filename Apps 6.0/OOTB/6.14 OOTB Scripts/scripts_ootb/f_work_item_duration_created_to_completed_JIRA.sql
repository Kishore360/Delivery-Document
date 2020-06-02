SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 then case when (coalesce(case when DM.dimension_wh_code in ('COMPLETED') and RES.dimension_wh_code in ('CANCELLED') then 0
 when DM.dimension_wh_code in ('COMPLETED') and SRC.created is not null then
 timestampdiff(second,coalesce(SRC.created,0),coalesce(dates.completed_on,0)) else 0 end,0) - coalesce(TRGT.duration_created_to_completed,'')) in (-3600, 3600) 
 then 'Failing due to timezone conversion issue for f_work_item.duration_created_to_completed'
 ELSE  'MDS to DWH data validation failed for f_work_item.duration_created_to_completed' END ELSE 'SUCCESS' END as Message
 from #MDS_TABLE_SCHEMA.issue_final SRC
 
left join #STG_TABLE_SCHEMA.issue_dates_temp dates
on SRC.id=dates.issueid
and SRC.sourceinstance=dates.sourceinstance

 left join #DWH_TABLE_SCHEMA.f_work_item TRGT
 on concat(SRC.id, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 left join #DWH_TABLE_SCHEMA.d_work_item LKP1
 on concat(SRC.id, '')=LKP1.row_id
 and SRC.sourceinstance=LKP1.source_id
 
 left join #DWH_TABLE_SCHEMA.d_lov_map DM
 on LKP1.work_item_status_src_key=DM.src_key
 
left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM','~',upper(SRC.resolution_id))=RES.src_rowid and SRC.sourceinstance = RES.source_id
 
 where coalesce(case when DM.dimension_wh_code in ('COMPLETED') and RES.dimension_wh_code in ('CANCELLED') then 0
 when DM.dimension_wh_code in ('COMPLETED') and SRC.created is not null then
 timestampdiff(second,coalesce(SRC.created,0),coalesce(dates.completed_on,0)) else 0 end,0) <>coalesce(TRGT.duration_created_to_completed,'');