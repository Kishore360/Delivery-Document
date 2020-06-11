SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.time_wasted_flag' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.issue_final SRC
left join (
select tmp.issueid,tmp.sourceinstance, count(1) as time_wasted_count
from #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
left join #DWH_TABLE_SCHEMA.d_lov_map LM_TO
on concat('STATUS~WORK_ITEM~',upper(tmp.to))=LM_TO.src_rowid

left join #DWH_TABLE_SCHEMA.d_lov_map LM_FROM
on concat('STATUS~WORK_ITEM~',upper(tmp.from))=LM_FROM.src_rowid
 
where lower(tmp.field) = 'status' and LM_FROM.dimension_wh_code in ('IN PROGRESS') and LM_TO.dimension_wh_code in ('PROPOSED')

group by tmp.issueid,tmp.sourceinstance
) time_wasted_cnt
on SRC.id=time_wasted_cnt.issueid
and SRC.sourceinstance=time_wasted_cnt.sourceinstance
 
left join #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.id, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
 
where coalesce(case when time_wasted_cnt.time_wasted_count>0 then 'Y' else 'N' end,'N') <> coalesce(TRGT.time_wasted_flag,'');