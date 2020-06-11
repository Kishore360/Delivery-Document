SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.duration_work_start_to_completed' ELSE 'SUCCESS' END as Message
from #STG_TABLE_SCHEMA.workitem_temp_azure SRC
 
left join #STG_TABLE_SCHEMA.issue_dates_temp_azure dates
on SRC.__numerify__primary_key=dates.issueid
and SRC.sourceinstance=dates.sourceinstance
 
 left join #DWH_TABLE_SCHEMA.f_work_item TRGT
 on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id

 left join #DWH_TABLE_SCHEMA.d_lov_map DM
on concat('STATUS~WORK_ITEM~',upper(SRC.`state`))=DM.src_rowid and SRC.sourceinstance = DM.source_id

left join #DWH_TABLE_SCHEMA.d_lov_map RES
on concat('RESOLUTION~WORK_ITEM~',upper(SRC.msvsts_common_resolvedreason))=RES.src_rowid and SRC.sourceinstance = RES.source_id

where coalesce(case when DM.dimension_wh_code in ('COMPLETED') and (RES.dimension_wh_code<>'CANCELLED' or RES.dimension_wh_code is null) and dates.work_start_on is not null then
 timestampdiff(second,coalesce(dates.work_start_on,0),coalesce(dates.completed_on, SRC.msvsts_common_closeddate,0)) else 0 end,0) <>coalesce(TRGT.duration_work_start_to_completed,'')